//
//  SecondViewController.m
//  BookStore
//
//  Created by Rikard Andersson on 2012-05-19.
//  Copyright (c) 2012 itBrainiacs. All rights reserved.
//

#import "AddBookViewController.h"
#import "BookAttributeCell.h"
#import "ServerCommunicator.h"

@interface AddBookViewController ()

@end

@implementation AddBookViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITableView *tableView = [self tableView];
    [tableView setDelegate:self];
    attributeIndex = [NSArray arrayWithObjects:@"author",@"title", nil]; //Temporary solution
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = [NSString stringWithFormat:@"BookAttributeCell"];
    
    BookAttributeCell *cell = (BookAttributeCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell =  (BookAttributeCell *)[[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:NULL] objectAtIndex:0];
    }
    
    [cell setAttribute:[attributeIndex objectAtIndex:[indexPath row]]];
    
    [cell setDelegate:self];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [attributeIndex count];
}

- (IBAction)addBook:(id)sender
{
    if (!bookAttributes) {
        bookAttributes = [[NSMutableDictionary alloc] initWithCapacity:20];
    }
    if ([ServerCommunicator addBookWithAttributes:bookAttributes]) {
        [[[UIAlertView alloc] initWithTitle:@"Done" message:@"Book was added." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
    
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Failure" message:@"Something went wrong when trying to contact server." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
    }
}

- (void)setAttribute:(NSString *)attribute toValue:(NSString *)value
{
    if (!bookAttributes) {
        bookAttributes = [[NSMutableDictionary alloc] initWithCapacity:20];
    }
    
    [bookAttributes setValue:value forKey:attribute];
}

@end
