//
//  view3.m
//  Pract3
//
//  Created by mike on 11/10/14.
//  Copyright (c) 2014 mike. All rights reserved.
//

#import "view3.h"

@interface view3 ()

@end

@implementation view3
    int month, days, hrs, min;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.lblDif.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)evtCal:(id)sender {
  /*  NSCalendar *calendar =[[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian] autorelease];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:self.pick1.date toDate:self.pick2.date options:0];*/
    NSDateComponents *components;

    components = [[NSCalendar currentCalendar] components: NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute fromDate:self.pick1.date toDate:self.pick2.date options:0];
    month = (int) [components month];
    days = (int) [components day];
    hrs = (int) [components hour];
    min= (int) [components minute];

    self.lblDif.text = [NSString stringWithFormat:@"%d meses %d dias %d horas %d minutos", month, days, hrs, min];
    
    
    
}

- (IBAction)evtComp:(id)sender {
    NSString                    *strShareMsg;
    NSArray                     *aShareItems;
    UIImage                     *imgShare;
    UIActivityViewController    *actViewController;
    
    strShareMsg = [NSString stringWithFormat:@"La diferencia entre fechas es de %d meses %d dias %d horas %d minutos", month, days, hrs, min];

    //imgShare    = [UIImage imageNamed:[maAir objectAtIndex:pick1]];
    aShareItems = @[imgShare, strShareMsg];
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, UIActivityTypeSaveToCameraRoll, nil];
    
    [self presentViewController:actViewController animated:YES completion:nil];
}
@end
