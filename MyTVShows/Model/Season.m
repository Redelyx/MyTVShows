//
//  Season.m
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "Season.h"

@implementation Season

-(instancetype)initWithEpisodes:(NSArray *)episodes{
    if(self = [super init]){
        _episodes = [episodes copy];
    }
    return self;
}

@end
