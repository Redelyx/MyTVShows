//
//  TVShow.h
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TVShow : NSObject

-(instancetype)initWithName:(NSString *)name
                   category:(NSString *)category
                  platforms:(NSArray *)platforms
                       link:(NSURL *)link
                      notes:(NSString *)notes
                      score:(NSInteger *)score
                      image:(UIImageView *)image
                    seasons:(NSArray *)seasons;


@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSArray *platforms;
@property (nonatomic, strong) NSURL *link;
@property (nonatomic, strong) NSString *notes;
@property (nonatomic) NSInteger *score;
@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) NSArray *seasons;

@end

NS_ASSUME_NONNULL_END
