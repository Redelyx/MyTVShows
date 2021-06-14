//
//  GenericObj.h
//  MyTVShows
//
//  Created by Alice on 12/06/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@protocol GenericObj

-(void)deleteElement;
-(NSMutableArray *)allShows;
-(void)setNewName:(NSString *)name;
+(id *)elementOfName:(NSString *)name;
-(NSString *)displayName;
+(BOOL)existElementOfName:(NSString *)name;
-(NSString *)objectName;

@end
