/**
 * Tencent is pleased to support the open source community by making QTA available.
 * Copyright (C) 2016THL A29 Limited, a Tencent company. All rights reserved.
 * Licensed under the BSD 3-Clause License (the "License"); you may not use this
 * file except in compliance with the License. You may obtain a copy of the License at
 *
 * https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software distributed
 * under the License is distributed on an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS
 * OF ANY KIND, either express or implied. See the License for the specific language
 * governing permissions and limitations under the License.
 */
      
#import "LoginController.h"

@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:51/255.0 green:204/255.0 blue:255/255.0 alpha:1]];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(20, 130, self.view.frame.size.width-40, 70)];
    UIImage* image = [UIImage imageNamed:@"logo.gif"];
    NSTextAttachment* textAttach = [[NSTextAttachment alloc] init];
    textAttach.image = image;
    NSAttributedString * strA =[NSAttributedString attributedStringWithAttachment:textAttach];
    _label.attributedText = strA;
    [self.view addSubview:_label];
    
    
    _account=[[UITextField alloc] initWithFrame:CGRectMake(40, 220, self.view.frame.size.width-80, 50)];
    _account.backgroundColor=[UIColor whiteColor];
    _account.placeholder=[NSString stringWithFormat:@"Email"];
    _account.borderStyle= UITextBorderStyleRoundedRect;
    _account.keyboardType = UIKeyboardTypeEmailAddress;
    _account.isAccessibilityElement = TRUE;
    [self.view addSubview:_account];
    
    _password=[[UITextField alloc] initWithFrame:CGRectMake(40, 280, self.view.frame.size.width-80, 50)];
    _password.backgroundColor=[UIColor whiteColor];
    _password.placeholder=[NSString stringWithFormat:@"Password"];
    _password.borderStyle= UITextBorderStyleRoundedRect;
    _password.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_password];
    
    _loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_loginButton setFrame:CGRectMake(60, 340, self.view.frame.size.width-120, 50)];
    [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [_loginButton setBackgroundColor:[UIColor colorWithRed:51/255.0 green:102/255.0 blue:255/255.0 alpha:1]];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(pressLogin) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_loginButton];
}

-(void) pressLogin{
    
    NSString* strName = @"qta";
    NSString* strPass = @"123456";
    
    NSString* strTextName = _account.text;
    NSString* strTextPass = _password.text;
    
    if ([strName isEqualToString:strTextName] && [strPass isEqualToString:strTextPass]){
        NSLog(@"用户名密码正确！");
        CGRect bounds = self.view.bounds;
        UIWebView* webView = [[UIWebView alloc] initWithFrame:bounds];
        webView.scalesPageToFit = YES;
        UIViewController* vcWeb = [[UIViewController alloc] init];
        [vcWeb.view addSubview:webView];
        NSString *urlStr = @"https://qtacore.github.io/qt4w/demo.html";
        
        NSURL *url = [NSURL URLWithString:urlStr];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [webView loadRequest:request];
        [self.navigationController pushViewController:vcWeb animated:YES];;
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"error" message:@"登录失败" preferredStyle:UIAlertControllerStyleActionSheet];
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击取消");
        }]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"重新登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击重新登录");
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_account resignFirstResponder];
    [_password resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
