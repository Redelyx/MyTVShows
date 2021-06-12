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

-(NSNumber *)countEpisodes;
-(void)addNumberOfEpisodes:(NSNumber *)number;

@end

NS_ASSUME_NONNULL_END
