//
//  view3.h
//  Pract3
//
//  Created by mike on 11/10/14.
//  Copyright (c) 2014 mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface view3 : UIViewController
@property (strong, nonatomic) IBOutlet UIDatePicker *pick2;
@property (strong, nonatomic) IBOutlet UILabel *lblDif;
- (IBAction)evtCal:(id)sender;
- (IBAction)evtComp:(id)sender;

@property (strong, nonatomic) IBOutlet UIDatePicker *pick1;
@end
