//
//  TVShow+Utils.h
//  MyTVShows
//
//  Created by Alice on 26/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TVShow+CoreDataClass.h"
#import "Category+CoreDataClass.h"
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface TVShow (Utils)
+(TVShow *)initWithName:(NSString *)name
                   category:(Category *)category
                  platforms:(NSMutableArray *)platforms
                       link:(NSString *)link
                      notes:(NSString *)notes
                      score:(NSNumber *)score
                      image:(UIImage *)image
                    seasons:(NSMutableArray *)seasons;

+(void)deleteTVShow:(TVShow *)show;

+(NSMutableArray *)allShowsOfCategory:(Category *)category;
 
+(NSMutableArray *)allShowsWithScore:(NSNumber *)score;

@end

NS_ASSUME_NONNULL_END
