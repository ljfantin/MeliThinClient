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

@implementation MTCMeliServiceApiImpl

- (instancetype)init
{
    self = [super init];
    if (self) {
        //TODO Hacer una clase que levante propiedades de un archivo
        _url = @"https://api.mercadolibre.com/sites/MLA/search";
    }
    return self;
}

//TODO Ver si puedo hacer un metodo generico que haga un GET y desde este llamarlo
-(void) search:(NSString*)query
{
    NSDictionary * params = @{@"q":query};
    NSMutableURLRequest * request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:self.url parameters:params error:nil];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    
    __block MTCMeliServiceApiImpl * weakSelf = self;
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Respuesta json search %@: %@", query, responseObject);
        NSArray * listItems = [weakSelf parseResults:responseObject];
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

-(NSArray*) parseResults:(NSDictionary*)json
{
    NSArray * jsonResults = json[@"results"];
    NSMutableArray * listItems = [NSMutableArray array];
    for (NSDictionary * item in jsonResults) {
        //mapeo json
        NSString * title = [item objectForKey:@"title"];
        NSString * subtitle = [item objectForKey:@"subtitle"];
        NSNumber * price = [item objectForKey:@"price"];
        NSNumber * quantity = [item objectForKey:@"available_quantity"];
        NSString * condition = [item objectForKey:@"condition"];
        NSString * urlThumbnail = [item objectForKey:@"thumbnail"];
        UIImage * image = [UIImage imageWithUrl:urlThumbnail];
        
        //creo el dto
        MTCItemDto * item = [MTCItemDto initWithTitle:title price:price subtitle:subtitle availableQuantity:quantity condition:condition thumbnail:image];
        
        //agrego el item
        [listItems addObject:item];
    }
    
    return listItems;
}

- (void) setDelegate:(id<MTCServiceApiDelegate>)newDelegate
{
    [newDelegate retain];
    [delegate release];
    delegate = newDelegate;
}

- (id<MTCServiceApiDelegate>) getDelegate{
    return [delegate autorelease];
}


- (void)dealloc
{
    [_url release];
    [delegate release];
    [super dealloc];
}

@end
