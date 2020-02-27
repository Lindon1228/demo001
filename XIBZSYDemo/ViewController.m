//
//  ViewController.m
//  XIBZSYDemo
//
//  Created by Lindon on 2019/11/7.
//  Copyright © 2019 Lindon. All rights reserved.
//

#import "ViewController.h"
#import "SYTableViewCell.h"
#import "ListModel.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (strong,nonatomic) NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.label.text = @"假设你已经对label正常添加了约束条件，按照以下几个步骤即可任意设置label控件的";
    
    self.bottomLabel.text = @"还有闹得沸沸扬扬路人皆知，最终达成和解的苹果与高通基带纠纷，和解协议中就包括了高通向苹果提供基带的合作。在这个4G网络即将成为明日黄花、5G正是热门的时间点，苹果选择接受高通基带，很明显是为了5G相关支持而来。不出意外的话，我们很可能在明年秋季见到苹果的首款5G iPhone，这也是苹果惯例的新一代iPhone发布时间点。换句话说，iPhone 11系列之后就是5G iPhone，嘴上说超前的苹果实际上已经投入了5G研发。向来把企业价值观放在重要位置的苹果，同样是一家能够贯彻自身表态的企业，此前的环保生产宣言中已经可见一斑。那么为什么这次库克宁愿用官话味十足的发言表态，也要在支持5G的问题上“口是心非”呢？这恐怕得和5G基带研发的难度，以及更多不可控情况联系起来。英特尔5G基带的跳票使得iPhone不可能在今年支持5G，之后苹果宣布收购英特尔基带业务仿佛让人看到一丝曙光，可实际上需要等待更长的时间。";
    
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.estimatedSectionFooterHeight = 0;
//    self.tableView.estimatedSectionHeaderHeight = 0;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SYTableViewCell" bundle:nil] forCellReuseIdentifier:@"SYTableViewCell"];
    
    [self getData];
    
}





- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    //利用systemLayoutSizeFittingSize:计算出真实高度
    CGFloat height = [self.tableView.tableHeaderView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    CGRect headerFrame = self.tableView.tableHeaderView.frame;
    headerFrame.size.height = height;
    //修改tableHeaderView的frame
    self.tableView.tableHeaderView.frame = headerFrame;
    
    CGFloat footHeight = [self.tableView.tableFooterView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;

    CGRect footerFrame = self.tableView.tableFooterView.frame;
    footerFrame.size.height = footHeight;
    self.tableView.tableFooterView.frame = footerFrame;
    
    
}


- (void)getData {
    
    
    
    NSArray *array = @[@"看到没有，只需要两行代码就能解决tableviewCell的自适应高度（切忌不要在代理方法里面再去返回cell的高度，还有xib的约束一定要整对）",@"有时候我们在用xib拖tableviewCell得时候，可能会有动态改变cell高度的时候，比如说遇到文本过多，需要换行，这时候的cell的高度就不是固定的了。然而，一般解决这个问题的步骤也不难，就是挨个去计算需要换行的label的高度，最后得到总高度，再在tableview的代理方法里面去返回这个高度。但是如果你用xib，那就是洒洒水，小意思啦。",@"但是我用的是另一种方法，就是通过category来增加属性，因为我觉得这种写法很方便，至于方便在哪里，后面为你揭晓答案",@"storyboard中的tableview添加headerView",@"最后的效果就是下面的了，红色的就是tableview的tableHeaderView。（你是不是发现我的这个控制器比你的长，哈哈。把你的控制器的size设置为Freeform，参照第二步，这样你就想拖多长就拖多长，tableHeaderView也可以想拖多长就拖多长，这样妈妈就再也不用担心控件过多，一个屏幕摆放不完的问题了）",@"将view的size设为",@"还有闹得沸沸扬扬路人皆知，最终达成和解的苹果与高通基带纠纷，和解协议中就包括了高通向苹果提供基带的合作。在这个4G网络即将成为明日黄花、5G正是热门的时间点，苹果选择接受高通基带，很明显是为了5G相关支持而来。不出意外的话，我们很可能在明年秋季见到苹果的首款5G iPhone，这也是苹果惯例的新一代iPhone发布时间点。换句话说，iPhone 11系列之后就是5G iPhone，嘴上说超前的苹果实际上已经投入了5G研发。向来把企业价值观放在重要位置的苹果，同样是一家能够贯彻自身表态的企业，此前的环保生产宣言中已经可见一斑。那么为什么这次库克宁愿用官话味十足的发言表态，也要在支持5G的问题上“口是心非”呢？这恐怕得和5G基带研发的难度，以及更多不可控情况联系起来。英特尔5G基带的跳票使得iPhone不可能在今年支持5G，之后苹果宣布收购英特尔基带业务仿佛让人看到一丝曙光，可实际上需要等待更长的时间。"];
    
    self.dataArray = [NSMutableArray array];
    
    
    for (int i = 0; i<array.count; i++) {
        
        ListModel *obj = [ListModel new];
        obj.name = array[i];
        obj.content = array[array.count-1-i];
        obj.isClose = YES;
        
        
        [self.dataArray addObject:obj];
        
    }
    
//    [self.tableView reloadData];
    
    
    
    
    
    
    
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    SYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYTableViewCell"];
    
    cell.currentVC = self;
    cell.indexPath = indexPath;
 
    
    if (indexPath.row%2 == 0) {

        cell.centerViewH.constant = indexPath.row *20;
    }else{

        cell.centerViewH.constant = indexPath.row *10;
    }
    
    cell.obj = self.dataArray[indexPath.row];
    
    
    return cell;
}




@end
