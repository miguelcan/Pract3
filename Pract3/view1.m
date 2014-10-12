//
//  view1.m
//  Pract3
//
//  Created by mike on 11/10/14.
//  Copyright (c) 2014 mike. All rights reserved.
//

#import "view1.h"
#import "FirendList.h"
#import "vars.h"

@interface view1 ()

@end

@implementation view1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        maFrd     =  [NSMutableArray arrayWithObjects:@"Jebus", @"Changoleon", @"Jaime", @"Laura", @"Carmen", @"Pancho", nil];
        maImgf     =  [NSMutableArray arrayWithObjects:@"jebus.jpg", @"chango.jpg", @"jaimed.jpg", @"laura.jpg", @"carmen.jpg", @"pancho.jpg", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**********************************************************************************************
 Table Functions
 **********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 74;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FirendList";
    
    FirendList *cell = (FirendList *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[FirendList alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.lblName.text       = maFrd[indexPath.row];
    cell.imgFriend.image    = [UIImage imageNamed:maImgf[indexPath.row]];
    
    return cell;
}

//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   /* strSelectedName     = [NSString stringWithFormat:@"%@", maNames[indexPath.row]];
    strSelectedImg      = [NSString stringWithFormat:@"%@", maImages[indexPath.row]];
    
    NSLog(@"strSelectedName %@", strSelectedName);
    NSLog(@"strSelectedImg %@", strSelectedImg);
    
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"Details"];
    [self presentViewController:vc animated:YES completion:nil];*/
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)evtShare:(id)sender {
    NSString                    *strShareMsg;
    NSArray                     *aShareItems;
    UIImage                     *imgShare;
    UIActivityViewController    *actViewController;
    
    NSString *frd = [maFrd componentsJoinedByString:@", "];
    strShareMsg = [NSString stringWithFormat:@"Mi directorio completo es: %@",frd];
    imgShare    = [UIImage imageNamed:@"meta.jpg"];
    aShareItems = @[imgShare, strShareMsg];
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, UIActivityTypeSaveToCameraRoll, nil];
    
    [self presentViewController:actViewController animated:YES completion:nil];
}
@end
