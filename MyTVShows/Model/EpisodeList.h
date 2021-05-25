//
//  EpisodeList.h
//  MyTVShows
//
//  Created by Alice on 25/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Episode.h"

NS_ASSUME_NONNULL_BEGIN

@interface EpisodeList : NSObject

-(NSArray *)getAll;
-(void)add:(Episode *)s;
-(void)add;
-(void)addAmount:(int)number;
-(Episode *)getAtIndex:(NSInteger)index;
-(long)size;

@end

NS_ASSUME_NONNULL_END
