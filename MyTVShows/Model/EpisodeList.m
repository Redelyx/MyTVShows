//
//  EpisodeList.m
//  MyTVShows
//
//  Created by Alice on 25/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "EpisodeList.h"

@interface EpisodeList ()

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation EpisodeList

-(instancetype)init{
    if(self = [super init]){
        _list = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSArray *)getAll{
    return self.list;
}

-(void)add{
    [self.list addObject:[[Episode alloc]initWithName:[NSString stringWithFormat:@"Episode %ld", self.size+1]]];
}

-(void)add:(Episode *)f{
    [self.list addObject:f];
}

-(void)addAmount:(int)number{
    for(int i = 0; i< number; i++){
        [self.list addObject:[[Episode alloc]initWithName:[NSString stringWithFormat:@"Episode %ld", self.size+1]]];
    }
}
-(Episode *)getAtIndex:(NSInteger)index{
    return [self.list objectAtIndex:index];
}

-(long)size{
    return self.list.count;
}

@end


