//
//  FirstViewController.m
//  BookStore
//
//  Created by Rikard Andersson on 2012-05-19.
//  Copyright (c) 2012 itBrainiacs. All rights reserved.
//

#import "SearchBooksViewController.h"
#import "BookAttributeCell.h"
#import "ServerCommunicator.h"

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
    NSString *cellIdentifier = [NSString stringWithFormat:@"BookAttributeCell"];
    
    BookAttributeCell *cell = (BookAttributeCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell =  (BookAttributeCell *)[[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:NULL] objectAtIndex:0];
    }
    
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
// TODO: Make sure that an empty Dictionary returns all the resutls in the list

- (IBAction)searchBooks:(id)sender
{
    if (!searchParams) {
        searchParams = [[NSMutableDictionary alloc] initWithCapacity:20];
    }
    
    NSDictionary *searchResults = [ServerCommunicator searchBooksWithAttributes:searchParams];
    
    if (!searchResults) {
        [[[UIAlertView alloc] initWithTitle:@"No search results" message:@"Something went wrong when trying to contact server." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
    
    } else {
        // *** SHOW ANOTHER VIEW 
        
        [[[UIAlertView alloc] initWithTitle:@"YEAY" message:@"Implement this shit and you'll be fine." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];

    }
}
@end
