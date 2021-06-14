//
//  EditShowTableViewController.h
//  MyTVShows
//
//  Created by Alice on 13/06/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TVShow+Utils.h"

NS_ASSUME_NONNULL_BEGIN

@interface EditShowTableViewController : UITableViewController <UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>


@property (nonatomic, strong) TVShow *theShow;

@end

NS_ASSUME_NONNULL_END
