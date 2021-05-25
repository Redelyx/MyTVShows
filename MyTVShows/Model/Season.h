//
//  Season.h
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EpisodeList.h"

NS_ASSUME_NONNULL_BEGIN

@interface Season : NSObject

-(instancetype)initWithName:(NSString *)name
                   Episodes:(EpisodeList *)episodes;
-(instancetype)initWithEpisodes:(EpisodeList *)episodes;
-(instancetype)initWithSeasonNumber:(int)number
                           Episodes:(EpisodeList *)episodes;
-(long)size;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) EpisodeList *episodes;

@end

NS_ASSUME_NONNULL_END
