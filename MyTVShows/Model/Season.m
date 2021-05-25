//
//  Season.m
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "Season.h"

@implementation Season

-(instancetype)initWithName:(NSString *)name
                   Episodes:(EpisodeList *)episodes{
    if(self = [super init]){
        _name = name;
        _episodes = episodes;
    }
    return self;
}

-(instancetype)initWithEpisodes:(EpisodeList *)episodes{
    return [self initWithName:@"" Episodes:episodes];
}

-(instancetype)initWithSeasonNumber:(int)number
    Episodes:(EpisodeList *)episodes{
    return [self initWithName:[NSString stringWithFormat:@"Season %i", number] Episodes:episodes];
}

-(long)size{
    return [self.episodes size];
}



@end
