//
//  CreatureViewController.m
//  MCMS
//
//  Created by roshan on 07/10/2014.
//  Copyright (c) 2014 learningIOS. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController () <UITextFieldDelegate>
@property (readwrite) NSMutableArray *creaturesP;
@property (weak, nonatomic) IBOutlet UITextField *editEnterCreatureNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *editCountryTextField;

@property (weak, nonatomic) IBOutlet UILabel *nameToShowLabel;
@property (readwrite) MagicalCreature *aMagicalCreature;
@property (weak, nonatomic) IBOutlet UILabel *countryToShowLabel;


@end

@implementation CreatureViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    self.aMagicalCreature = self.magicalCreature;
    self.creaturesP = self.creatures;//Is this required? for persistance?

    //Hide the editing fields by default
    self.editEnterCreatureNameTextField.hidden = YES;
    self.editCountryTextField.hidden = YES;

    NSLog(@"%@", self.aMagicalCreature.name);
    self.nameToShowLabel.text = self.aMagicalCreature.name;
    self.countryToShowLabel.text = self.aMagicalCreature.countryOfOrigin;


}


- (void)setEditing:(BOOL)editing animated:(BOOL)animate
{
    [super setEditing:editing animated:animate];
    if(editing)
    {
        self.editEnterCreatureNameTextField.hidden = NO;
        self.editCountryTextField.hidden = NO;
    }
    else
    {
        self.aMagicalCreature.name = self.editEnterCreatureNameTextField.text;
        self.aMagicalCreature.countryOfOrigin = self.editCountryTextField.text;
        self.nameToShowLabel.text = self.aMagicalCreature.name;
        self.countryToShowLabel.text = self.aMagicalCreature.countryOfOrigin;
        self.navigationItem.title = self.aMagicalCreature.name;
        self.editEnterCreatureNameTextField.hidden = YES;
        self.editCountryTextField.hidden = YES;

    }

}





@end
