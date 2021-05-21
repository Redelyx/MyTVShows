//
//  ShowDetailTableViewController.h
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TVShow.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShowDetailTableViewController : UITableViewController

@property (nonatomic, strong) TVShow *theShow;

@end

NS_ASSUME_NONNULL_END
