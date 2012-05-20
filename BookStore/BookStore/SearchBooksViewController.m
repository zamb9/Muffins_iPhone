//
//  FirstViewController.m
//  BookStore
//
//  Created by Rikard Andersson on 2012-05-19.
//  Copyright (c) 2012 itBrainiacs. All rights reserved.
//

#import "SearchBooksViewController.h"
#import "BookAttributeCell.h"

@interface SearchBooksViewController ()

@end

@implementation SearchBooksViewController

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
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

// *** This design might not be the optimal choice. Acceptable for now. ***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BookAttributeCell *cell = (BookAttributeCell *)[[NSBundle mainBundle] loadNibNamed:@"BookAttributeCell" owner:self options:NULL];
    
    [cell setAttribute:[attributeIndex objectAtIndex:[indexPath row]]];
    
    [cell setSearchBookViewController:self];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [attributeIndex count];
}

// *** Method called when something has been edited in a ViewControllerCell. Not the best design maybe? ***

- (void)setAttribute:(NSString *)attribute toValue:(NSString *)value
{
    if (!searchParams) {
        searchParams = [[NSMutableDictionary alloc] initWithCapacity:20];
    }
    
    [searchParams setValue:value forKey:attribute];
}

// *** Method called when search button is pressed ***

- (IBAction)searchBooks:(id)sender
{
    NSArray *allAttributes = [searchParams allKeys];
    for (NSString* cAttribute in allAttributes)
    {
        
    }
}

@end
