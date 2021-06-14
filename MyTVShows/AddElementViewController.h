//
//  AddElementViewController.h
//  MyTVShows
//
//  Created by Alice on 04/06/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Platform+Utils.h"
#import "Category+Utils.h"
#import "GenericObj.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddElementViewController : UIViewController

@property (nonatomic) int viewType; //0 new, 1 edit;
@property (nonatomic) int elementType;
@property (nonatomic, strong) id element;

@end

NS_ASSUME_NONNULL_END
