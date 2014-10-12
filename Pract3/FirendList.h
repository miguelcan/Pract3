//
//  FirendList.h
//  Pract3
//
//  Created by mike on 11/10/14.
//  Copyright (c) 2014 mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirendList : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UIImageView *imgFriend;
- (IBAction)evtShareCell:(id)sender;

@end
