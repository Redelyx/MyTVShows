//
//  mainNavigationController.h
//  MyTVShows
//
//  Created by Alice on 03/06/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowListTableViewController.h"
#import "ManageElementTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainNavigationController : UINavigationController <UINavigationControllerDelegate>

@property (nonatomic) int elementType;

@end

NS_ASSUME_NONNULL_END
