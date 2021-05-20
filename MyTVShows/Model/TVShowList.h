//
//  TVShowList.h
//  MyTVShows
//
//  Created by Alice on 20/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TVShow.h"

NS_ASSUME_NONNULL_BEGIN

@interface TVShowList : NSObject

-(NSArray *)getAll;
-(void)add:(TVShow *)s;
-(TVShow *)getAtIndex:(NSInteger)index;
-(long)size;

@end

NS_ASSUME_NONNULL_END
