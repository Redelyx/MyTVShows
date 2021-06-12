//
//  Platform+Utils.h
//  MyTVShows
//
//  Created by Alice on 27/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Platform+CoreDataProperties.h"

NS_ASSUME_NONNULL_BEGIN

@interface Platform (Utils)

+(Platform *)initWithName:(NSString *)name;
+(NSMutableArray *)allPlatforms;
+(Platform *)platformOfName:(NSString *)name;
+(NSString *)platformsString:(NSSet *)platforms;
-(void)deletePlatform;
-(void)deleteElement;
-(NSMutableArray *)allShows;
-(void)setNewName:(NSString *)name;
+(Platform *)elementOfName:(NSString *)name;
-(NSString *)displayName;
@end

NS_ASSUME_NONNULL_END
