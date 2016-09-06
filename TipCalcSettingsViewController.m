//
//  TipCalcSettingsViewController.m
//  TipCalculator
//
//  Created by Omm on 9/5/16.
//  Copyright © 2016 Omm. All rights reserved.
//

#import "TipCalcSettingsViewController.h"

@implementation TipCalcSettingsViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.rateSegmentBar setSelectedSegmentIndex:self.rateIndex];
}

- (IBAction)rateValueChange:(id)sender {
    [self.delegate rateSettingsValueChange:[self.rateSegmentBar selectedSegmentIndex]];
}

@end
