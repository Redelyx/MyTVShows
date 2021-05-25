//
//  SeasonList.m
//  MyTVShows
//
//  Created by Alice on 25/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "SeasonList.h"

@interface SeasonList ()

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation SeasonList

-(instancetype)init{
    if(self = [super init]){
        _list = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSArray *)getAll{
    return self.list;
}

-(void)add:(Season *)f{
    [self.list addObject:f];
}

-(Season *)getAtIndex:(NSInteger)index{
    return [self.list objectAtIndex:index];
}

-(long)size{
    return self.list.count;
}

@end
