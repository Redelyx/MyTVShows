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
                       link:(NSString *)link
                      notes:(NSString *)notes
                      score:(NSNumber *)score
                      image:(UIImage *)image
                    seasons:(SeasonList *)seasons{
    if(self = [super init]){
        _name = [name copy];
        _category = [category copy];
        _platforms = [platforms copy];
        _link = [link copy];
        _notes = [notes copy];
        _score = score;
        _image = [image copy];
        _seasons = seasons;
    }
    return self;
}

-(instancetype)initWithName:(NSString *)name
                   category:(NSString *)category
                  platforms:(NSArray *)platforms
                      score:(NSNumber *)score
                      image:(UIImage *)image
                    seasons:(SeasonList *)seasons{
    return[self initWithName:name
                    category:category
                   platforms:platforms
                       link :@""
                       notes:@""
                       score:score
                       image:image
                     seasons:seasons];
}

-(instancetype)initWithName:(NSString *)name
                   category:(NSString *)category
                  platforms:(NSArray *)platforms
                      score:(NSNumber *)score
                    seasons:(SeasonList *)seasons{
    return[self initWithName:name
                    category:category
                   platforms:platforms
                       link :@""
                       notes:@""
                       score:score
                       image:[UIImage imageNamed:@""]
                     seasons:seasons];
}

-(instancetype)initWithName:(NSString *)name
                   category:(NSString *)category
                  platforms:(NSArray *)platforms
                       link:(NSString *)link
                      notes:(NSString *)notes
                      score:(NSNumber *)score
                    seasons:(SeasonList *)seasons{
    return[self initWithName:name
                    category:category
                   platforms:platforms
                       link :link
                       notes:notes
                       score:score
                       image:[UIImage imageNamed:@""]
                     seasons:seasons];
}

-(NSString *)displayName{
    return self.name;
}

-(long)size{
    return [self.seasons size];
}

-(Season *)getSeasonNumber:(long)index{
    return [self.seasons getAtIndex:index];
}


@end
