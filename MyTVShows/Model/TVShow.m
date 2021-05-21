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

-(instancetype)initWithName:(NSString *)name
                   category:(NSString *)category
                  platforms:(NSArray *)platforms
                      score:(NSNumber *)score
                      image:(UIImage *)image
                    seasons:(NSArray *)seasons{
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
                    seasons:(NSArray *)seasons{
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
                    seasons:(NSArray *)seasons{
    return[self initWithName:name
                    category:category
                   platforms:platforms
                       link :@""
                       notes:@""
                       score:score
                       image:[UIImage imageNamed:@""]
                     seasons:seasons];
}

-(NSString *)displayName{
    return self.name;
}

-(long)seasonSize{
    return self.seasons.count;
}

-(Season *)getSeasonNumber:(NSInteger)index{
    return [self.seasons objectAtIndex:index];
}

@end
