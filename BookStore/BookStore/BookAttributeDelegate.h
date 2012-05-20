//
//  BookAttributeResponder.h
//  BookStore
//
//  Created by Rikard Andersson on 2012-05-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BookAttributeDelegate <NSObject>

@required
- (void)setAttribute:(NSString *)attribute toValue:(NSString *)value;

@end
