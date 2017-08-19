//
//  ViewController.m
//  ProjectSet
//
//  Created by 刘双 on 2017/8/19.
//  Copyright © 2017年 jpym.product.com. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import <ReactiveObjC.h>
#import "PopViewController.h"

@interface ViewController ()<UIPopoverPresentationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *mView;
//@property (nonatomic,strong) PopViewController *popView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self.mView rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        PopViewController *popView = [PopViewController new];
        popView.modalPresentationStyle = UIModalPresentationPopover;
        popView.preferredContentSize = CGSizeMake(200, 200);
        popView.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
        popView.popoverPresentationController.delegate = self;
        popView.popoverPresentationController.sourceRect = self.mView.bounds;
        popView.popoverPresentationController.sourceView = self.mView;
        [self presentViewController:popView animated:YES completion:nil];
    }];
}

#pragma mark - popover方法会触发一下代理，UIModalPresentationFormSheet不会触发
- (BOOL) popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    
    return YES;
    
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    
    return UIModalPresentationNone;
}

- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    
    NSLog(@"dismissed");
    
}


//- (void)viewWillLayoutSubviews{
//    UIView *superView = self.view;
//    NSLog(@"%ld,%ld",(long)self.view.traitCollection.horizontalSizeClass,(long)self.view.traitCollection.verticalSizeClass);
//    if (UIUserInterfaceSizeClassCompact == self.view.traitCollection.horizontalSizeClass && UIUserInterfaceSizeClassCompact == self.view.traitCollection.verticalSizeClass) {
//        [self.mView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(superView).offset(10);
//            make.top.equalTo(superView).offset(10);
//            make.width.equalTo(@100);
//            make.height.equalTo(@50);
//        }];
//    }else if (UIUserInterfaceSizeClassRegular == self.view.traitCollection.horizontalSizeClass && UIUserInterfaceSizeClassCompact == self.view.traitCollection.verticalSizeClass) {
//        [self.mView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.equalTo(superView).offset(-10);
//            make.right.equalTo(superView).offset(-10);
//            make.width.equalTo(@200);
//            make.height.equalTo(@100);
//        }];
//    }else if (UIUserInterfaceSizeClassCompact == self.view.traitCollection.horizontalSizeClass && UIUserInterfaceSizeClassRegular== self.view.traitCollection.verticalSizeClass){
//        [self.mView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(superView).offset(10);
//            make.top.equalTo(superView).offset(10);
//            make.width.equalTo(@100);
//            make.height.equalTo(@50);
//        }];
//    }
////    UIPresentationController替代了 UIPopoverController，使用与iPhone上
//    
//}


//在 traitCollection 发生变化时，这个方法将被调用
//- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
//    
//}
////在不同的设备上做出不同的样式，很有用的方法，通过代码是很麻烦的一件事情，可以通过xib实现
//- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
