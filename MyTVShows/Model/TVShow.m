//
//  TVShow.m
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "TVShow.h"

@implementation TVShow
-(instancetype)initWithName:(NSString *)name
                   category:(NSString *)category
                  platforms:(NSArray *)platforms
                       link:(NSURL *)link
                      notes:(NSString *)notes
                      score:(NSInteger *)score
                      image:(UIImageView *)image
                    seasons:(NSArray *)seasons{
    if(self = [super init]){
        _name = [name copy];
        _category = [category copy];
        _platforms = [platforms copy];
        _link = [link copy];
        _notes = [notes copy];
        _score = score;
        _image = [image copy];
        _seasons = [seasons copy];
    }
    return self;
}

@end
