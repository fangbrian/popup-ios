//
//  SearchViewController.m
//  popup
//
//  Created by Brian Fang  on 1/27/16.
//  Copyright © 2016 The Vampire Company. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@property NSMutableArray *searchItems;
@property NSArray *searchResults;
@property NSMutableString *category;

@end


@implementation SearchViewController

@synthesize searchbar;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.searchItems = @[@"fangbrian", @"brianfang", @"fang"];
    
    [self initializeTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializeTableView
{
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    self.tableView.layoutMargins = UIEdgeInsetsZero;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.searchResults count];
        
    } else {
        return [self.searchItems count];
    }
}

- (void)tableView:(UITableView *)tableView  willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView setBackgroundColor:[UIColor grayColor]];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [tableView setBackgroundView:nil];
    [cell setBackgroundColor:[UIColor clearColor]];
    [cell.contentView setBackgroundColor:[UIColor clearColor]];
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    separatorLineView.backgroundColor = [UIColor clearColor]; // set color as you want.
    [cell.contentView addSubview:separatorLineView];
}

-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
        if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
            }
    
//    cell.textLabel.text = [self.searchItems objectAtIndex:indexPath.row];
    
    UIView *view = [[UIView alloc] initWithFrame: CGRectMake (0, 0, self.view.frame.size.width - 10, cell.frame.size.height - 5)];
    view.tag = 1;
    view.center = CGPointMake(self.view.frame.size.width/2, cell.frame.size.height/2);
    
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, cell.frame.size.height/2)];
    text.center = CGPointMake(self.view.frame.size.width/2, cell.frame.size.height/2);
    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        cell.textLabel.text = [self.searchResults objectAtIndex:indexPath.row];
        [text setText:[self.searchResults objectAtIndex:indexPath.row]];
    } else {
        [text setText:[self.searchItems objectAtIndex:indexPath.row]];
    }
    text.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15];
    [view addSubview:text];
    
    [view setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:1.0]];
    [cell.contentView addSubview:view];
    cell.separatorInset = UIEdgeInsetsMake(0, 160, 0, 160);
    return cell;
}



- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchText];
    self.searchResults = [self.searchItems filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

- (BOOL)respondsToSelector:(SEL)sel {
    NSLog(@"Queried about %@", NSStringFromSelector(sel));
    return [super respondsToSelector:sel];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    NSLog(@"searchBarShouldBeginEditing -Are we getting here??");
    return YES;
}

-(void) searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    NSLog(@"searchBarTextDidBeginEditing -Are we getting here??");
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"Text change - %d");
    

    // [self.tblContentList reloadData];
}


@end
