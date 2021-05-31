//
//  Episode+Utils.h
//  MyTVShows
//
//  Created by Alice on 27/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Episode+CoreDataClass.h"
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface Episode (Utils)

+(Episode *) initWithName:(NSString *)name
                   season:(Season *)season;

@end

NS_ASSUME_NONNULL_END
