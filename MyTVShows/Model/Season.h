//
//  Season.h
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Episode.h"

NS_ASSUME_NONNULL_BEGIN

@interface Season : NSObject

-(instancetype)initWithEpisodes:(NSArray *)episodes;

@property (nonatomic, strong) NSArray *episodes;

@end

NS_ASSUME_NONNULL_END
