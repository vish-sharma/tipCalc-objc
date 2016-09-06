//
//  TipCalcSettingsViewController.h
//  TipCalculator
//
//  Created by Omm on 9/5/16.
//  Copyright © 2016 Omm. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol rateSegmentValueDelegate <NSObject>

-(void) rateSettingsValueChange:(long)index;

@end

@interface TipCalcSettingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *rateSegmentBar;
@property (weak, nonatomic) id<rateSegmentValueDelegate> delegate;
@property (nonatomic) long rateIndex;

@end
