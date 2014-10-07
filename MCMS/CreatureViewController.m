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

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creaturesP = self.creatures;
    self.editEnterCreatureNameTextField.hidden = YES;

}


- (IBAction)editButtonPressed:(UIButton *)sender {

    [self.editEnterCreatureNameTextField becomeFirstResponder];
    if(self.editEnterCreatureNameTextField.editing)
    {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        NSLog(@"%@", sender.titleLabel.text);
        self.editEnterCreatureNameTextField.hidden = NO;

    }
    else
    {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self.editEnterCreatureNameTextField resignFirstResponder];
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    NSString *originalTitle = self.title;
    self.title = textField.text;

    for(MagicalCreature *eachCreature in self.creaturesP)

    {
        NSString *name = eachCreature.name;
        if([name isEqualToString:originalTitle])
        {
            [eachCreature modifyName:textField.text];
            NSLog(@"%@", eachCreature.name);
        }
    }
    return YES;
}



@end
