//
//  BookAttributeCell.h
//  BookStore
//
//  Created by Rikard Andersson on 2012-05-19.
//  Copyright (c) 2012 itBrainiacs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchBooksViewController.h"

@interface BookAttributeCell : UITableViewCell <UITextFieldDelegate> {
    
    IBOutlet UITextField *mTextField;
    NSString *mAttribute;
    NSString *mValue;
}

@property (nonatomic, retain) NSString *attribute;
@property (nonatomic, retain, readonly) NSString *value;
@property (nonatomic, assign) SearchBooksViewController *searchBookViewController;

@end
