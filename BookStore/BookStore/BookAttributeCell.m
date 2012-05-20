//
//  BookAttributeCell.m
//  BookStore
//
//  Created by Rikard Andersson on 2012-05-19.
//  Copyright (c) 2012 itBrainiacs. All rights reserved.
//

#import "BookAttributeCell.h"

@implementation BookAttributeCell

@synthesize attribute = mAttribute;
@synthesize value = mValue;
@synthesize delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setAttribute:(NSString *)attribute
{
    mAttribute = attribute;
    
    [mTextField setPlaceholder:attribute];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField text]) {
        mValue = [textField text];
        [delegate setAttribute:mAttribute toValue:mValue];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}


@end
