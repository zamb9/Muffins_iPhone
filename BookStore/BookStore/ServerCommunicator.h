//
//  ServerCommunicator.h
//  BookStore
//
//  Created by Rikard Andersson on 2012-05-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerCommunicator : NSObject <NSURLConnectionDelegate> {
    
}

+ (NSDictionary *)searchBooksWithAttributes:(NSDictionary *)attributes;
+ (BOOL)addBookWithAttributes:(NSDictionary *)attributes;

@end
