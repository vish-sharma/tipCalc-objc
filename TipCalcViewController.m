//
//  TipCalcViewController.m
//  TipCalculator
//
//  Created by Omm on 9/5/16.
//  Copyright © 2016 Omm. All rights reserved.
//

#import "TipCalcViewController.h"
#import "TipCalcSettingsViewController.h"

@interface TipCalcViewController() <UITextFieldDelegate,rateSegmentValueDelegate>
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *rateSegmentBar;
@property (weak, nonatomic) IBOutlet UIView *tipCalculationView;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentageAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalAmount;

@property (strong, nonatomic) NSString* amount;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *amountLabelTopConstraint;
@end

@implementation TipCalcViewController

-(void) viewDidLoad{
    [super viewDidLoad];
    self.amountLabelTopConstraint.constant = 200.0f;
    
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(changeSettings:)];
    self.navigationItem.rightBarButtonItem = settingsButton;
}

-(void)changeSettings:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    TipCalcSettingsViewController *settingVC = [storyboard instantiateViewControllerWithIdentifier:@"TipCalcSettingsViewController"];
    [settingVC setRateIndex:[self.rateSegmentBar selectedSegmentIndex]];
    [settingVC setDelegate:self];
    [self.navigationController pushViewController:settingVC animated:YES];
}

-(void) rateSettingsValueChange:(long)index{
    [self.rateSegmentBar setSelectedSegmentIndex:index];
    [self tipCalculation:self.amount percent:[self.rateSegmentBar titleForSegmentAtIndex:self.rateSegmentBar.selectedSegmentIndex]];
}

- (IBAction)amountTextFieldEndEditing:(id)sender {
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (IBAction)rateSegmentValueChange:(id)sender {
    [self tipCalculation:self.amount percent:[self.rateSegmentBar titleForSegmentAtIndex:self.rateSegmentBar.selectedSegmentIndex]];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    self.amount = [self.amountTextField.text stringByReplacingCharactersInRange:range withString:string];
    
    if ([self.amount length]>0) {
        [self.rateSegmentBar setHidden:NO];
        [self.tipCalculationView setHidden:NO];
        self.amountLabelTopConstraint.constant = 70.0f;
    } else{
        [self.rateSegmentBar setHidden:YES];
        [self.tipCalculationView setHidden:YES];
        self.amountLabelTopConstraint.constant = 200.0f;
    }
    
    [self tipCalculation:self.amount percent:[self.rateSegmentBar titleForSegmentAtIndex:self.rateSegmentBar.selectedSegmentIndex]];
    
    return YES;
}

-(void) tipCalculation:(NSString*)textVal percent:(NSString*)rate {
    
    float percentVal = ([rate floatValue]/100)*[textVal floatValue];
    
    [self.tipPercentageAmount setText:[NSString stringWithFormat:@"%.2f",(float)percentVal]];
    
    float total = [textVal intValue]+percentVal;
    [self.totalAmount setText:[NSString stringWithFormat:@"$ %.2f",total]];
}

-(void) addViewAnimation:(BOOL) show {
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^(void) {
//                         self.tipCalculationView.frame = /* set the frame here */
                     }
                     completion:NULL];
}


@end
