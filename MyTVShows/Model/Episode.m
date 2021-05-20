//
//  Episode.m
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "Episode.h"

@implementation Episode

-(instancetype)initWithScore:(NSInteger *)score{
    if(self = [super init]){
        _score = score;
    }
    return self;
}

@end
