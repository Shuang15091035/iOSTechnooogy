//
//  HybirdViewController.m
//  ProjectSet
//
//  Created by admin on 2017/11/3.
//  Copyright © 2017年 jpym.product.com. All rights reserved.
//
/**
 oc与js通信的方法：
     1.通过代理方法中拦截方式与native交互，拦截URLSchema判断是否是我们需要的URL
     2.iOS7之后出了JavaScriptCore.framework 用于和js交互
     3.WebViewJavascriptBridge开源库version < 6.0(本质上，它也是通过webview的代理拦截scheme，然后注入相应的JS。)
     4.React-Native
 */
#import "HybirdViewController.h"

@interface HybirdViewController () <UIWebViewDelegate>
@property (nonatomic) UIWebView *webView;
@end

@implementation HybirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    self.webView.frame = self.view.bounds;
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
}
- (UIWebView *)webView {
    if (!_webView) {
        _webView = [UIWebView new];
        _webView.delegate = self;
    }
    return _webView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"%s",__func__);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
//    NSString *str = @"var img = docment.getElementsByTagName('img')[0]";
//    NSString *str1 = @"img.remove()";
//    [webView stringByEvaluatingJavaScriptFromString:str];
//    [webView stringByEvaluatingJavaScriptFromString:str1];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}

//
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *url = request.URL.absoluteString;
    NSLog(@"StartQuestURL:%@,%@,%@,%@",url,request.URL.scheme,request.URL.path,request.URL.query);
    NSRange range = [url rangeOfString:@"alter://"];
    NSUInteger location = range.location;
    if (location != NSNotFound) {
        NSString *str = [url substringFromIndex:location + range.length];
        SEL sel = NSSelectorFromString(str);
        [self performSelector:sel withObject:nil];
    }
    
    return YES;
}

- (void)showAlter {
    UIAlertView *alterView = [[UIAlertView alloc]initWithTitle:@"js invoke" message:@"message" delegate:self cancelButtonTitle:@"cancle" otherButtonTitles:@"other", nil];
    [alterView show];
}

@end

//利用JavaScriptCore.framework

#import <JavaScriptCore/JavaScriptCore.h>

@interface HybirdJSCViewController()

@end

@implementation HybirdJSCViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}
- (void)didReceiveMemoryWarning {
    
}

@end

