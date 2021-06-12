//
//  ShowListTableViewController.h
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TVShow+Utils.h"
#import "ShowDetailTableViewController.h"
#import "Category+Utils.h"
#import "Platform+Utils.h"
#import "OptionsTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShowListTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *shows;
@property (nonatomic) int viewType;
@property (nonatomic, strong) Platform *platform;
@property (nonatomic, strong) Category *category;
@property (nonatomic, strong) id element;
@property (nonatomic) BOOL showAll;
@property (nonatomic) int score;


@end

NS_ASSUME_NONNULL_END
