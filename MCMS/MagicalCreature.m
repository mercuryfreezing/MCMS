//
//  MagicalCreature.m
//  MCMS
//
//  Created by roshan on 07/10/2014.
//  Copyright (c) 2014 learningIOS. All rights reserved.
//

#import "MagicalCreature.h"

@interface MagicalCreature()


@end

@implementation MagicalCreature

-(instancetype) initWithName:(NSString *) aName{

    self = [super init];
    if(aName.length == 0)
    {
        [NSException raise:NSInvalidArgumentException format:@"Dragons must have a name"];
    }

    self.name = aName;
    return self;
}

-(void) modifyName: (NSString *) aName{
    self.name = aName;
}

@end
