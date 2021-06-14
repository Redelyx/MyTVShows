//
//  OptionsTableViewController.h
//  MyTVShows
//
//  Created by Alice on 04/06/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ManageElementTableViewController.h"
#import "AddElementViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface OptionsTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *shows;
@property (nonatomic) int elementType;
@property (nonatomic, strong) id element;

@end

NS_ASSUME_NONNULL_END
