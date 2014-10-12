//
//  FirendList.m
//  Pract3
//
//  Created by mike on 11/10/14.
//  Copyright (c) 2014 mike. All rights reserved.
//

#import "FirendList.h"
#import "vars.h"

@implementation FirendList

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)evtShareCell:(id)sender {
    NSLog(@"TEST %ld",(long)self.btnCom.tag);
    NSString                    *strShareMsg;
    NSArray                     *aShareItems;
    UIImage                     *imgShare;
    UIActivityViewController    *actViewController;
    
                              
    strShareMsg = [NSString stringWithFormat:@"El contacto seleccionado es: %@",maFrd[self.btnCom.tag]];
    imgShare    = [UIImage imageNamed:[maImgf objectAtIndex:self.btnCom.tag]];
    aShareItems = @[imgShare, strShareMsg];
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, UIActivityTypeSaveToCameraRoll, nil];
    
    [self.viewController presentViewController:actViewController animated:YES completion:nil];
}
@end
