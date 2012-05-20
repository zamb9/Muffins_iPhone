//
//  FirstViewController.h
//  BookStore
//
//  Created by Rikard Andersson on 2012-05-19.
//  Copyright (c) 2012 itBrainiacs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookAttributeDelegate.h"

@interface SearchBooksViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, BookAttributeDelegate> {
    
    NSMutableDictionary *searchParams;
    NSArray *attributeIndex;
}

- (IBAction)searchBooks:(id)sender;

@end
