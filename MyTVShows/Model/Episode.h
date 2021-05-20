//
//  Episode.h
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Episode : NSObject

@property (nonatomic) NSInteger *score;

-(instancetype)initWithScore:(NSInteger *)score;

@end

NS_ASSUME_NONNULL_END
