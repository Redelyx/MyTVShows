//
//  Episode.m
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "Episode.h"

@implementation Episode

-(instancetype)initWithName:(NSString *)name
                      Score:(NSNumber *)score{
    if(self = [super init]){
        _name = [name copy];
        _score = [score copy];
        _watched = NO;
    }
    return self;
}
-(instancetype)initWithName:(NSString *)name{
    return [self initWithName: name Score:[NSNumber numberWithInt:0]];
}

@end
