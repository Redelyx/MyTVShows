//
//  AddShowTableViewController.h
//  MyTVShows
//
//  Created by Alice on 24/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Category+Utils.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddShowTableViewController : UITableViewController <UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *categoryPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *platformPicker;

@end

NS_ASSUME_NONNULL_END
