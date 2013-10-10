//
//  ViewController.m
//  JSONExample
//
//  Created by Eugene Romanishin on 23.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SectionManager.h"
#import "SectionModel.h"

@implementation SectionManager
{
    NSArray *sections;
    NSMutableArray *sectionsMutableArray;
    NSMutableData *data;
}
@synthesize delegate;

- (id)init
{
    	if (self=[super init]) {
            sectionsMutableArray = [[NSMutableArray alloc]init];
            [NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(fetch) userInfo:nil repeats:YES];
            [self fetch];
        }
    return self;
}

-(void) fetch
{
    sections = nil;
    [data setLength:0];
    [sectionsMutableArray removeAllObjects];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSURL *url = [NSURL URLWithString:@"http://api.investcafe.ru/rubrics.rss"];
    NSURLRequest *reqest = [NSURLRequest requestWithURL:url];
    NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:reqest delegate:self];
    
    NSLog(@"manager load");
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    data = [[NSMutableData alloc]init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)thedata
{
    [data appendData:thedata];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    sections  = [NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
    
    for (int i=0; i<sections.count; i++) {
        SectionModel *section = [[SectionModel alloc]init];
        section.section_id = [[[sections objectAtIndex:i] objectForKey:@"id"] intValue];
        section.title = [[sections objectAtIndex:i] objectForKey:@"name"];
        [sectionsMutableArray addObject:section];
    }
    [delegate sectionArray:sectionsMutableArray];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSLog(@"error download");
    UIAlertView* alert = [[UIAlertView alloc]  initWithTitle:@"Ошибка" message:@"Сервер недоступен, проверьте соединение с интернетом" delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}

@end
