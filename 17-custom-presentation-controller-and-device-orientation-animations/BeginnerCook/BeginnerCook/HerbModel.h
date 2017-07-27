//
//  HerbModel.h
//  BeginnerCook
//
//  Created by zyon on 27/07/2017.
//  Copyright © 2017 Zyon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HerbModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *desc;

+ (NSArray <HerbModel*>*)all;

@end
