//
//  BattleViewController.m
//  MCMS
//
//  Created by roshan on 08/10/2014.
//  Copyright (c) 2014 learningIOS. All rights reserved.
//

#import "BattleViewController.h"

@interface BattleViewController ()
@property (readwrite) MagicalCreature *aMagicalCreature;
@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

        self.aMagicalCreature = self.magicalCreature;

}

@end
