# iOSTechnooogy
about iOS SDK update
#pragma mark - SDK 8.0
//    UISplitViewController
//ipad & iphone 通用的方法而 UINavigationController 也实现了 -showViewController:sender: 的版本。对于在 navController 栈中的 vc，会调用 push 方式进行展示，而对 splitVC，showViewController:sender: 将在 MasterViewController 中进行 push，
// [self showViewController:<#(nonnull UIViewController *)#> sender:<#(nullable id)#>]
//    [self showDetailViewController:<#(nonnull UIViewController *)#> sender:<#(nullable id)#>

//    UIPresentationController替代了 UIPopoverController，使用与iPhone上
