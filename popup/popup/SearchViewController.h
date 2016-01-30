//
//  SearchViewController.h
//  popup
//
//  Created by Brian Fang  on 1/27/16.
//  Copyright © 2016 The Vampire Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate>
{
    UISearchBar * searchbar;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UISearchBar* searchbar;

@end
