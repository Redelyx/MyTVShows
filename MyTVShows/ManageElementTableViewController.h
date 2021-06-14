//
//  ManageElementTableViewController.h
//  MyTVShows
//
//  Created by Alice on 06/06/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Category+Utils.h"
#import "Platform+Utils.h"
#import "AddElementViewController.h"
#import "ShowListTableViewController.h"
#import "GenericObj.h"

NS_ASSUME_NONNULL_BEGIN

@interface ManageElementTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *elements;
@property (nonatomic) int elementType;

@end

NS_ASSUME_NONNULL_END
