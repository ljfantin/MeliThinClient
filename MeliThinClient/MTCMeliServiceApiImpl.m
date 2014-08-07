//
//  MTCMeliServiceApiImpl.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCMeliServiceApiImpl.h"
#import "AFHTTPRequestOperationManager.h"


@implementation MTCMeliServiceApiImpl


+ (instancetype)sharedInstance {
    
    static dispatch_once_t onceToken;
    static id instance;
    
    dispatch_once(&onceToken,^{
        instance = [[MTCMeliServiceApiImpl alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _url = @"https://api.mercadolibre.com/sites/MLA/search";
    }
    return self;
}

//TODO Ver si puedo hacer un metodo generico que haga un GET y desde este llamarlo
-(NSArray*)search:(NSString*)query {
    
    /*AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary * params = @{@"q":query};
    
    
    NSMutableURLRequest * request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:self.url parameters:params error:nil];

    [manager GET:self.url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Json Respuesta Meli: %@", responseObject);
        [self parseResults:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    return nil;*/
    
    //NSURL *URL = [NSURL URLWithString:self.url];
    //NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSDictionary * params = @{@"q":query};
    NSMutableURLRequest * request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:self.url parameters:params error:nil];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    [[NSOperationQueue mainQueue] addOperation:op];
    return nil;
}

-(NSArray*) parseResults:(NSDictionary*)json
{
    NSArray * results = json[@"results"];
    NSLog(results);
    return results;
}

- (void)dealloc
{
    [_url release];
    [super dealloc];
}
@end
