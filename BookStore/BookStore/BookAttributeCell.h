//
//  BookAttributeCell.h
//  BookStore
//
//  Created by Rikard Andersson on 2012-05-19.
//  Copyright (c) 2012 itBrainiacs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchBooksViewController.h"
#import "BookAttributeDelegate.h"

@interface BookAttributeCell : UITableViewCell <UITextFieldDelegate> {
    
    IBOutlet UITextField *mTextField;
    NSString *mAttribute;
    NSString *mValue;
    __unsafe_unretained id<BookAttributeDelegate> delegate;
}

@property (nonatomic, retain) NSString *attribute;
@property (nonatomic, retain, readonly) NSString *value;
@property (nonatomic, assign) id<BookAttributeDelegate> delegate;

@end
