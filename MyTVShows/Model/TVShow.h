//
//  TVShow.h
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SeasonList.h"

NS_ASSUME_NONNULL_BEGIN

@interface TVShow : NSObject

-(instancetype)initWithName:(NSString *)name
                   category:(NSString *)category
                  platforms:(NSArray *)platforms
                       link:(NSString *)link
                      notes:(NSString *)notes
                      score:(NSNumber *)score
                      image:(UIImage *)image
                    seasons:(SeasonList *)seasons;

-(instancetype)initWithName:(NSString *)name
                   category:(NSString *)category
                  platforms:(NSArray *)platforms
                      score:(NSNumber *)score
                      image:(UIImage *)image
                    seasons:(SeasonList *)seasons;

-(instancetype)initWithName:(NSString *)name
                   category:(NSString *)category
                  platforms:(NSArray *)platforms
                      score:(NSNumber *)score
                    seasons:(SeasonList *)seasons;

-(instancetype)initWithName:(NSString *)name
                   category:(NSString *)category
                  platforms:(NSArray *)platforms
                       link:(NSString *)link
                      notes:(NSString *)notes
                      score:(NSNumber *)score
                    seasons:(SeasonList *)seasons;


@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSArray *platforms;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *notes;
@property (nonatomic) NSNumber *score;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) SeasonList *seasons;

@property (nonatomic, readonly) NSString *displayName;

-(long)size;
-(Season *)getSeasonNumber:(long)index;

@end

NS_ASSUME_NONNULL_END
