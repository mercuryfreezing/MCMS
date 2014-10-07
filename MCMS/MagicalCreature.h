//
//  MagicalCreature.h
//  MCMS
//
//  Created by roshan on 07/10/2014.
//  Copyright (c) 2014 learningIOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject
@property NSString *name;
@property NSString *countryOfOrigin;

-(instancetype) initWithName:(NSString *) aName;
-(void) modifyName: (NSString *) aName;

@end
