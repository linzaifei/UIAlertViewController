//
//  ViewController.m
//  UIAlertViewController
//
//  Created by xinshiyun on 2017/5/17.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "ViewController.h"
#import "PopViewController.h"
@interface ViewController ()<UIPopoverPresentationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *popBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}

- (IBAction)PopAction:(UIBarButtonItem *)sender {
   
    PopViewController *popViewController = [[PopViewController alloc] init];
    popViewController.modalPresentationStyle = UIModalPresentationPopover;
    popViewController.popoverPresentationController.barButtonItem = sender;
    popViewController.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    popViewController.popoverPresentationController.backgroundColor = popViewController.view.backgroundColor;
    popViewController.preferredContentSize = CGSizeMake(100, 150);
    popViewController.popoverPresentationController.delegate = popViewController;
    [self presentViewController:popViewController animated:YES completion:NULL];
}

- (IBAction)Action1:(UIButton *)sender {
    
    PopViewController *popViewController = [[PopViewController alloc] init];
    popViewController.modalPresentationStyle = UIModalPresentationPopover;
    popViewController.popoverPresentationController.sourceView = self.popBtn;
    popViewController.popoverPresentationController.sourceRect = self.popBtn.bounds;
    popViewController.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    popViewController.popoverPresentationController.backgroundColor = popViewController.view.backgroundColor;
    popViewController.preferredContentSize = CGSizeMake(100, 150);
    popViewController.popoverPresentationController.delegate = popViewController;
    [self presentViewController:popViewController animated:YES completion:NULL];
 

}


- (IBAction)Action:(UISegmentedControl *)sender {
    NSLog(@"%ld",sender.selectedSegmentIndex);
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self alert];
            break;
        case 1:
            [self alertMessage];
            break;
        case 2:
            [self setSheet];
            break;
        default:
            break;
    }
}

-(void)alert{
    NSString *title = @"温馨提示";
    NSString *message = @"还记得看哈看似简单很快就安徽省科技的";
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    //修改标题的内容，字号，颜色。使用的key值是“attributedTitle”
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"你好吗"];
    [str addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18],NSForegroundColorAttributeName : [UIColor redColor]} range:NSMakeRange(0, [str string].length)];
    
    [alertVC setValue:str forKey:@"attributedTitle"];
    
    //修改AlertAction 字体颜色
    [ok setValue:[UIColor purpleColor] forKey:@"_titleTextColor"];
    [cancel setValue:[UIColor orangeColor] forKey:@"_titleTextColor"];
    
    [alertVC addAction:ok];
    [alertVC addAction:cancel];
    [self presentViewController:alertVC animated:YES completion:^{
        
    }];
}

-(void)alertMessage{
    NSString *title = @"温馨提示";
    NSString *message = @"登录";
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
    textField.placeholder = @"登录";
    }];
    
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
      textField.placeholder = @"密码";
    }];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"登录 = %@",[alertVC.textFields firstObject].text);
        NSLog(@"密码 = %@",[alertVC.textFields lastObject].text);
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    
    //修改标题的内容，字号，颜色。使用的key值是“attributedTitle”
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"你好吗"];
    [str addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18],NSForegroundColorAttributeName : [UIColor redColor]} range:NSMakeRange(0, [str string].length)];
    
    [alertVC setValue:str forKey:@"attributedTitle"];
    
    //修改AlertAction 字体颜色
    [ok setValue:[UIColor purpleColor] forKey:@"_titleTextColor"];
    [cancel setValue:[UIColor orangeColor] forKey:@"_titleTextColor"];
    
    
    [alertVC addAction:ok];
    [alertVC addAction:cancel];
    
    [self presentViewController:alertVC animated:YES completion:^{
        
    }];
}

-(void)setSheet{
   
    NSString *title = @"温馨提示";
    NSString *message = @"登录";
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    
    //修改标题的内容，字号，颜色。使用的key值是“attributedTitle”
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"你好吗"];
    [str addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18],NSForegroundColorAttributeName : [UIColor redColor]} range:NSMakeRange(0, [str string].length)];
    
    [alertVC setValue:str forKey:@"attributedTitle"];
    
    //修改AlertAction 字体颜色
    [ok setValue:[UIColor purpleColor] forKey:@"_titleTextColor"];
    [cancel setValue:[UIColor orangeColor] forKey:@"_titleTextColor"];
    
    
    [alertVC addAction:ok];
    [alertVC addAction:cancel];
    
    [self presentViewController:alertVC animated:YES completion:^{
       
        
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
