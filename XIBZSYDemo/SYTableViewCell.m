//
//  SYTableViewCell.m
//  XIBZSYDemo
//
//  Created by Lindon on 2019/11/7.
//  Copyright © 2019 Lindon. All rights reserved.
//

#import "SYTableViewCell.h"
#import "Tool.h"



@implementation SYTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bottomLabel.lineBreakMode = NSLineBreakByCharWrapping;
    
    
}
- (IBAction)sqButtonClick:(UIButton *)sender {
    
    self.obj.isClose = !self.obj.isClose;
    
    
   
    [self.currentVC.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:self.indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
//    [self.currentVC.tableView reloadData];
    
    

  
    
    
    
    
}

- (void)updateCellWithListModel:(ListModel *)obj {
    
    self.bottomLabel.text = obj.content;
    
    self.sqButtonH.constant = 0;
    self.sqButton.hidden = YES;
    
    
    BOOL flage = [self infocount:self.bottomLabel];

    if (flage) {


        if (obj.isClose) {



            
            [self.sqButton setTitle:@"全文" forState:UIControlStateNormal];
            self.bottomLabel.numberOfLines = 2;

            self.sqButtonH.constant = 0;
            self.sqButton.hidden = NO;

        }else{

            
            [self.sqButton setTitle:@"收起" forState:UIControlStateNormal];
            self.bottomLabel.numberOfLines = 0;
            self.sqButtonH.constant = 36;
            self.bottomLabel.text = obj.content;
            self.sqButton.hidden = NO;
        }






    }else{

        self.sqButtonH.constant = 0;
        self.bottomLabel.text = obj.content;
        self.sqButton.hidden = YES;
        self.bottomLabel.numberOfLines = 0;



    }
    
    
}



- (void)setObj:(ListModel *)obj {
    
    
    _obj = obj;
    self.nameLabel.text = obj.name;
    self.bottomLabel.text = obj.content;
    
    
    [self updateCellWithListModel:obj];
    
    
//    [self infocount:self.bottomLabel];
    
    
    
    
    
    
}

- (BOOL)infocount:(UILabel *)lable{
    
    NSArray *stringArr = [Tool getLinesArrayOfStringInLabel:lable];
    
    if (stringArr.count>2) {
       
        
        
        
        return YES;
    }

    return NO;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
