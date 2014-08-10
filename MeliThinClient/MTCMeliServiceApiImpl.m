//
//  MTCMeliServiceApiImpl.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCMeliServiceApiImpl.h"
#import "AFHTTPRequestOperationManager.h"
#import "MTCItemDto.h"
#import "UIImage+Utils.h"
#import "MTCSearchJsonTranslator.h"
#import "MTCPicturesJsonTranslator.h"
#import "MTCPagerList.h"


@implementation MTCMeliServiceApiImpl

- (instancetype)init
{
    self = [super init];
    if (self) {
        //TODO Hacer una clase que levante propiedades de un archivo
        _url = @"https://api.mercadolibre.com/";
        _searchJsonParser = [[MTCSearchJsonTranslator alloc] init];
        _picturesJsonParser = [[MTCPicturesJsonTranslator alloc] init];
    }
    return self;
}

//TODO Ver si puedo hacer un metodo generico que haga un GET y desde este llamarlo
-(void) search:(NSString*)query pager:(MTCPagerList*)pager
{
    ////Si el delegate tiene implementado onPreExecute
    if ([[self getDelegate] respondsToSelector:@selector(onPreExecute)]) {
        [[self getDelegate] onPreExecute];
    }
    
    //construyo url
    NSMutableString * urlSearch = [NSMutableString stringWithString:self.url];
    [urlSearch appendString:@"sites/MLA/search"];
    //agrego parametros
    NSString * limitValue = [@(pager.limit) stringValue];
    NSString * offSetValue = [@(pager.offset) stringValue];
    NSDictionary * params = @{@"q":query,@"limit":limitValue,@"offset":offSetValue};
    
    
    NSMutableURLRequest * request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlSearch parameters:params error:nil];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    
    __block MTCMeliServiceApiImpl * weakSelf = self;
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Respuesta json search %@: %@", query, responseObject);
        NSArray * listItems = [weakSelf.searchJsonParser parse:responseObject];
        //onPostExecute
        NSDictionary * paging = responseObject[@"paging"];
        pager.total = [paging[@"total"] intValue];
        pager.offset = [paging[@"offset"] intValue];
        [[weakSelf getDelegate] onPostExecute:listItems];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        //Si el delegate tiene implementado el manejo de errores entonces lo invoco.
        if ([[weakSelf getDelegate] respondsToSelector:@selector(handleError:)]) {
            [[weakSelf getDelegate] handleError:error];
        }
    }];
    [[NSOperationQueue mainQueue] addOperation:op];
}

-(void) pictures:(NSString *)idItem
{
    ////Si el delegate tiene implementado onPreExecute
    if ([[self getDelegate] respondsToSelector:@selector(onPreExecute)]) {
        [[self getDelegate] onPreExecute];
    }
    
    //construyo url
    NSMutableString * urlPictures = [NSMutableString stringWithString:self.url];
    [urlPictures appendString:@"items/"];
    [urlPictures appendString:idItem];
    
    //agrego parametros
    NSDictionary * params = @{@"attributes":@"pictures"};
    
    NSMutableURLRequest * request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlPictures parameters:params error:nil];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    
    __block MTCMeliServiceApiImpl * weakSelf = self;
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //NSLog(@"Respuesta json search %@: %@", query, responseObject);
        NSArray * pictures = [weakSelf.picturesJsonParser parse:responseObject];
        //onPostExecute
        [[weakSelf getDelegate] onPostExecute:pictures];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        //Si el delegate tiene implementado el manejo de errores entonces lo invoco.
        if ([[weakSelf getDelegate] respondsToSelector:@selector(handleError:)]) {
            [[weakSelf getDelegate] handleError:error];
        }
    }];
    [[NSOperationQueue mainQueue] addOperation:op];
}

- (void) setDelegate:(id<MTCServiceApiDelegate>)newDelegate
{
    [newDelegate retain];
    [delegate release];
    delegate = newDelegate;
}

- (id<MTCServiceApiDelegate>) getDelegate{
    return delegate;
}


- (void)dealloc
{
    [_url release];
    [delegate release];
    [super dealloc];
}

@end
