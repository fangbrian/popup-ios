//
//  SearchViewController.h
//  popup
//
//  Created by Brian Fang  on 1/27/16.
//  Copyright © 2016 The Vampire Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
