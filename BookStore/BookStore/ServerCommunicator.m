//
//  ServerCommunicator.m
//  BookStore
//
//  Created by Rikard Andersson on 2012-05-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ServerCommunicator.h"

@interface ServerCommunicator()

+ (NSData *)requestResponseFromURL:(NSURL *)url withData:(NSDictionary *)dictionaryData;

@end

@implementation ServerCommunicator

// *** Returns a dictionary with all books in the search results 

+ (NSDictionary *)searchBooksWithAttributes:(NSDictionary *)attributes
{
    NSURL *url = [NSURL URLWithString:@"http://muffins.trestad.net/muffin_app/search_books.php"];
            
    NSData *searchResults = [ServerCommunicator requestResponseFromURL:url withData:attributes];
    
    if (searchResults) {
        
        NSError *jsonError = nil;
        
        NSDictionary *returnDictionary = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:searchResults options:0 error:&jsonError];
        
        if (jsonError) {
            NSLog(@"Returned result could not be converted to NSDictionary");
        }
        
        return returnDictionary;
    
    } else {
        NSLog(@"Something went wrong, got nil back");
        
        return nil;
    }
}

// *** Returns true if communication with server was successful

+ (BOOL)addBookWithAttributes:(NSDictionary *)attributes
{
    NSURL *url = [NSURL URLWithString:@"http://muffins.trestad.net/muffin_app/add_book.php"];
    
    NSData *addBook = [ServerCommunicator requestResponseFromURL:url withData:attributes];
    
    if (addBook) {
        
        return TRUE;
    
    } else {
        
        return FALSE;
    }
}

+ (NSData *)requestResponseFromURL:(NSURL *)url withData:(NSDictionary *)dictionaryData
{
    dictionaryData = [NSDictionary dictionaryWithObject:dictionaryData forKey:@"jsondata"];
    
    NSData *data;
    
    if ([NSJSONSerialization isValidJSONObject:dictionaryData]) {
        
        NSError *jsonError = nil;
        
        data = [NSJSONSerialization dataWithJSONObject:dictionaryData options:0 error:&jsonError];
        
        if (jsonError) {
            
            NSLog(@"JSON-error");
            
            return nil;
        }
        
    } else {
        
        NSLog(@"Not accepted as a JSONObject");
        
        return nil;
    }
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    
    [request setHTTPBody:data];
    
    NSURLResponse *response = nil;
    
    NSError *connectionError = nil;
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&connectionError];
    
    if (connectionError) {
        NSLog(@"Connection error");
        
        return nil;
    }
    
    return returnData;
}

@end
