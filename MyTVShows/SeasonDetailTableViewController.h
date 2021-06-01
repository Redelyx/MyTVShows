//
//  SeasonDetailTableViewController.h
//  MyTVShows
//
//  Created by Alice on 25/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Season+Utils.h"
#import "EpisodeDetailViewController.h"
#import "AddEpisodesViewController.h"
#import "TVShow+Utils.h"


NS_ASSUME_NONNULL_BEGIN

@interface SeasonDetailTableViewController : UITableViewController

@property (nonatomic, strong) Season *theSeason;

@end

NS_ASSUME_NONNULL_END
