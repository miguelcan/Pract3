//
//  view2.h
//  Pract3
//
//  Created by mike on 11/10/14.
//  Copyright (c) 2014 mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface view2 : UIViewController
@property (strong, nonatomic) IBOutlet UIPickerView *pickFly;
@property (strong, nonatomic) IBOutlet UILabel *lblAero;
@property (strong, nonatomic) IBOutlet UILabel *lblOri;
@property (strong, nonatomic) IBOutlet UILabel *lblDest;
- (IBAction)evtVis:(id)sender;
- (IBAction)evComp:(id)sender;

@end
