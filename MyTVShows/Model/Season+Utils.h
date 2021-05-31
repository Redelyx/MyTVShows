//
//  Season+Utils.h
//  MyTVShows
//
//  Created by Alice on 27/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Season+CoreDataProperties.h"
#import "Episode+Utils.h"

NS_ASSUME_NONNULL_BEGIN

@interface Season (Utils)

+(Season *) initWithName:(NSString *)name
                    show:(TVShow *)show;

+(NSNumber *)countEpisodesOfSeason:(Season *)season;
+(void)addEpisodesWithNumber:(NSNumber *)number toSeason:(Season *)season;

@end

NS_ASSUME_NONNULL_END
