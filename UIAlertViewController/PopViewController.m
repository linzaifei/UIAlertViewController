//
//  PopViewController.m
//  UIAlertViewController
//
//  Created by xinshiyun on 2017/5/18.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "PopViewController.h"
@interface PopViewController()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableVIew;

@end
@implementation PopViewController



-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self setUI];
}

-(void)setUI{
    self.tableVIew = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100, 150) style:UITableViewStylePlain];
    [self.tableVIew registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass( [UITableViewCell class])];
    self.tableVIew.delegate = self;
    self.tableVIew.dataSource = self;
    [self.view addSubview:self.tableVIew];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = @"cell";
    return cell;
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

// 是否可以dismiss,返回YES代表可以，返回NO代表不可以(点击空白区域)
- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    return YES;
}

/* If this method is not implemented, or returns nil, then the originally presented view controller is used. */
- (nullable UIViewController *)presentationController:(UIPresentationController *)controller viewControllerForAdaptivePresentationStyle:(UIModalPresentationStyle)style{
    NSLog(@"controller = %@",controller);
    
    return nil;
}

// If there is no adaptation happening and an original style is used UIModalPresentationNone will be passed as an argument.
- (void)presentationController:(UIPresentationController *)presentationController willPresentWithAdaptiveStyle:(UIModalPresentationStyle)style transitionCoordinator:(nullable id <UIViewControllerTransitionCoordinator>)transitionCoordinator NS_AVAILABLE_IOS(8_3){
    
     NSLog(@"presentationController = %@",presentationController);
     NSLog(@"style = %ld",style);
     NSLog(@"transitionCoordinator = %@",transitionCoordinator);
}
@end
