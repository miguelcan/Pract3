//
//  view2.m
//  Pract3
//
//  Created by mike on 11/10/14.
//  Copyright (c) 2014 mike. All rights reserved.
//

#import "view2.h"
#import "vars.h"

@interface view2 ()

@end

@implementation view2

long aero=0;
long orig=0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    maAero     =  [NSMutableArray arrayWithObjects:@"Taca", @"Avianca", @"Pan Am", nil];
    maOri      =  [NSMutableArray arrayWithObjects:@"Mex", @"Gdl", @"Mty", @"Gua", @"Zac", @"Can", @"Tab",  @"Tij", @"Cjs", nil];
    maDest      =  [NSMutableArray arrayWithObjects:@"Sin", @"Tor", @"Her", @"Chi", @"Ver", @"Pbc", @"Tol",  @"Aca", @"Zac", @"Agu", @"Cuu", @"Cen", @"Cul", @"Clq", @"Hmo", @"Hux", @"Lap", @"Bjx", @"Sjd", @"Lmm", @"Mzt", @"Mxl", @"Mlm", @"Oax", @"Pvr", @"Qro", @"Slp", nil];
    maAir       =  [NSMutableArray arrayWithObjects:@"taca.jpg", @"avianca.jpg", @"pan.jpg", nil];
    self.lblAero.text = @"ND";
    self.lblOri.text = @"ND";
    self.lblDest.text = @"ND";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Number of components.
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

// Total rows in our component.
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 3;
}

// Display each row's data.
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component ==0) {
        return maAero[row];
    } else if (component ==1){
        return maOri[(aero*3)+row];
    } else if (component==2){
        return maDest[(((aero*3)+orig)*3)+row];
    } else {
        return @"";
    }
}

// Do something with the selected row.
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"You selected this: %ld", (long)row);
    if (component==0){
        aero=row;
    } else if (component==1) {
        orig=row;
    }
    
    [self.pickFly reloadAllComponents];
    [super viewDidLoad];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)evtVis:(id)sender {
    NSInteger pick1 = [self.pickFly selectedRowInComponent:0];
    NSInteger pick2 = [self.pickFly selectedRowInComponent:1];
    NSInteger pick3 = [self.pickFly selectedRowInComponent:2];
    self.lblAero.text = maAero[pick1];
    self.lblOri.text  = maOri[(pick1*3)+pick2];
    self.lblDest.text = maDest[(((pick1*3)+pick2)*3)+pick3];
    
}

- (IBAction)evComp:(id)sender {
    NSInteger pick1 = [self.pickFly selectedRowInComponent:0];
    NSString                    *strShareMsg;
    NSArray                     *aShareItems;
    UIImage                     *imgShare;
    UIActivityViewController    *actViewController;
    
    strShareMsg = [NSString stringWithFormat:@"Voy a viajar por: %@, de %@ hacia %@", self.lblAero.text, self.lblOri.text, self.lblDest.text];
    imgShare    = [UIImage imageNamed:[maAir objectAtIndex:pick1]];
    aShareItems = @[imgShare, strShareMsg];
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, UIActivityTypeSaveToCameraRoll, nil];
    
    [self presentViewController:actViewController animated:YES completion:nil];
}
@end
