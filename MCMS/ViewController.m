//
//  ViewController.m
//  MCMS
//
//  Created by roshan on 07/10/2014.
//  Copyright (c) 2014 learningIOS. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *addCreatureTextField;
@property (weak, nonatomic) IBOutlet UITextField *addNumberOfLimbsTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MagicalCreature *creature1 = [[MagicalCreature alloc] initWithName:@"Sonya"];
    MagicalCreature *creature2 = [[MagicalCreature alloc] initWithName:@"Tanya"];
    MagicalCreature *creature3 = [[MagicalCreature alloc] initWithName:@"Ronya"];
    MagicalCreature *creature4 = [[MagicalCreature alloc] initWithName:@"Fonya"];

    creature1.countryOfOrigin = @"UK";
    creature2.countryOfOrigin = @"Denmark";
    creature3.countryOfOrigin = @"Sweden";
    creature4.countryOfOrigin = @"USA";


    self.creatures = [NSMutableArray arrayWithObjects:creature1,
                                                        creature2,
                                                            creature3,
                                                                creature4,
                                                                        nil];


}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.creatures.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"MyCellID" forIndexPath:indexPath ];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.countryOfOrigin;
    return cell;
}

- (IBAction)addCreatureButtonPressed:(UIButton *)sender {

    if(self.addCreatureTextField.text.length > 0)
        {
            MagicalCreature *creature = [[MagicalCreature alloc] initWithName: self.addCreatureTextField.text];
            creature.countryOfOrigin = self.addNumberOfLimbsTextField.text; //Label should be named countryOfOriginTextField

            [self.creatures insertObject:creature atIndex:0]; //Added to beginning of the collection. 
            self.addCreatureTextField.text = @"";
            self.addNumberOfLimbsTextField.text = @"";
            [self.addCreatureTextField resignFirstResponder];
            [self.tableView reloadData];
        }

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    CreatureViewController *creatureViewController = segue.destinationViewController;
    NSIndexPath *iP = [self.tableView indexPathForSelectedRow];
    MagicalCreature *creature = [self.creatures objectAtIndex:iP.row];

    creatureViewController.magicalCreature =creature;


    if([segue.identifier isEqualToString:@"ShowCreatureSegue"])
        {
            NSLog(@"%@", creature.name);
            creatureViewController.title = creature.name;
            creatureViewController.creatures = self.creatures;
        }
}

-(IBAction) unwindFromCreatureViewController:(UIStoryboardSegue *) segue{

            [self.tableView reloadData];
}

@end
