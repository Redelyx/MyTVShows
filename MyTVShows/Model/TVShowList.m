//
//  TVShowList.m
//  MyTVShows
//
//  Created by Alice on 20/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "TVShowList.h"

@interface TVShowList ()

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation TVShowList

-(instancetype)init{
    if(self = [super init]){
        _list = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSArray *)getAll{
    return self.list;
}

-(void)add:(TVShow *)f{
    [self.list addObject:f];
}

-(TVShow *)getAtIndex:(NSInteger)index{
    return [self.list objectAtIndex:index];
}

-(long)size{
    return self.list.count;
}

@end
