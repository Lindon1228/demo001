//
//  SYTableViewCell.h
//  XIBZSYDemo
//
//  Created by Lindon on 2019/11/7.
//  Copyright © 2019 Lindon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListModel.h"
#import "ViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface SYTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerViewH;
@property (weak, nonatomic) IBOutlet UIButton *sqButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sqButtonH;

@property (strong,nonatomic) ListModel *obj;
@property (nonatomic,strong) NSString *fixedText;
@property (nonatomic,strong) NSString *contentString;

@property (strong,nonatomic) ViewController *currentVC;

@property (strong,nonatomic) NSIndexPath *indexPath;



@end

NS_ASSUME_NONNULL_END
