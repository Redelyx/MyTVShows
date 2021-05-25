//
//  SeasonList.h
//  MyTVShows
//
//  Created by Alice on 25/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Season.h"

NS_ASSUME_NONNULL_BEGIN

@interface SeasonList : NSObject

-(NSArray *)getAll;
-(void)add:(Season *)s;
-(Season *)getAtIndex:(NSInteger)index;
-(long)size;

@end

NS_ASSUME_NONNULL_END
