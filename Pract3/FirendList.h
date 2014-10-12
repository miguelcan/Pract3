//
//  FirendList.h
//  Pract3
//
//  Created by mike on 11/10/14.
//  Copyright (c) 2014 mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirendList : UITableViewCell {
    UIViewController *viewController;
}
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UIImageView *imgFriend;
- (IBAction)evtShareCell:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnCom;
@property (nonatomic, assign) UIViewController *viewController;
@end
