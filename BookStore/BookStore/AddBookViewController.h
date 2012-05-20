//
//  SecondViewController.h
//  BookStore
//
//  Created by Rikard Andersson on 2012-05-19.
//  Copyright (c) 2012 itBrainiacs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookAttributeDelegate.h"

@interface AddBookViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, BookAttributeDelegate> {
    
    NSArray *attributeIndex;
    NSMutableDictionary *bookAttributes;
}

- (IBAction)addBook:(id)sender;


@end
