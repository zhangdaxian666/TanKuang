//
//  ViewController.m
//  TanKuang
//
//  Created by slcf888 on 2017/9/27.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btnZ =[UIButton buttonWithType:0];
    btnZ.backgroundColor =[UIColor yellowColor];
    btnZ.frame =CGRectMake(100, 100, 100, 100);
    btnZ.layer.cornerRadius =50;
    [btnZ addTarget:self action:@selector(TanKuang) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnZ];
    
    UIButton *btnX =[UIButton buttonWithType:0];
    btnX.backgroundColor =[UIColor greenColor];
    btnX.frame =CGRectMake(100, 300, 100, 100);
    btnX.layer.cornerRadius =50;
    [btnX addTarget:self action:@selector(TanKuangTwo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnX];
    
    UIButton *btn =[UIButton buttonWithType:0];
    btn.backgroundColor =[UIColor greenColor];
    btn.frame =CGRectMake(100, 500, 100, 100);
    btn.layer.cornerRadius =50;
    [btn addTarget:self action:@selector(TanKuangOne) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
    UILabel *labelZ =[[UILabel alloc]init];
    labelZ.frame =CGRectMake(100, 230, 200, 70);
    labelZ.text =@"123q123133223";
    labelZ.textColor =[UIColor redColor];
    labelZ.textAlignment =NSTextAlignmentRight;
//    [label sizeToFit];
    [self.view addSubview:labelZ];
    
    
    UILabel *label =[[UILabel alloc]init];
    label.frame =CGRectMake(0, 230, 200, 70);
    label.text =@"123q12";
    label.textColor =[UIColor redColor];
    //    [label sizeToFit];
    [self.view addSubview:label];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)TanKuang{
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"你的操作时非法的，您要继续吗" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
//    [alert show];
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"警告:你的操作时非法的，您要继续吗" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定"
                                              otherButtonTitles:@"关闭", nil];
    [sheet showInView:self.view];
}
#pragma mark UIAlertController == UIAlertView + UIActionSheet
- (void)TanKuangTwo{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"你的操作时非法的，您要继续吗" preferredStyle:UIAlertControllerStyleAlert];
    
    // 添加按钮
    __weak typeof(alert) weakAlert = alert;
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"点击了确定按钮--%@-%@", [weakAlert.textFields.firstObject text], [weakAlert.textFields.lastObject text]);
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"点击了取消按钮");
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"其它" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"点击了其它按钮");
    }]];
    
    // 添加文本框
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.textColor = [UIColor redColor];
        textField.text = @"123";
        [textField addTarget:self action:@selector(usernameDidChange:) forControlEvents:UIControlEventEditingChanged];
        //        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(usernameDidChange:) name:UITextFieldTextDidChangeNotification object:textField];
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.secureTextEntry = YES;
        textField.text = @"123";
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)usernameDidChange:(UITextField *)username
{
    NSLog(@"%@", username.text);
}
#pragma mark  点击屏幕
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"你的操作时非法的，您要继续吗" preferredStyle:UIAlertControllerStyleActionSheet];
    // 设置popover指向的item
    alert.popoverPresentationController.barButtonItem = self.navigationItem.leftBarButtonItem;
    
    // 添加按钮
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"点击了确定按钮");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"点击了取消按钮");
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark   其他在Info里面设置privce-phone
- (void)TanKuangOne{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    //按钮：拍照，类型：UIAlertActionStyleDefault
    [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"打开相机", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        /**
         其实和从相册选择一样，只是获取方式不同，前面是通过相册，而现在，我们要通过相机的方式
         */
        UIImagePickerController *PickerImage = [[UIImagePickerController alloc]init];
        //获取方式:通过相机
        PickerImage.sourceType = UIImagePickerControllerSourceTypeCamera;
        PickerImage.allowsEditing = YES;
        PickerImage.delegate = self;
        [self presentViewController:PickerImage animated:YES completion:nil];
    }]];
    
    //按钮：从相册选择，类型：UIAlertActionStyleDefault
    [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"打开相册", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //初始化UIImagePickerController
        UIImagePickerController *PickerImage = [[UIImagePickerController alloc]init];
        //获取方式1：通过相册（呈现全部相册），UIImagePickerControllerSourceTypePhotoLibrary
        //获取方式2，通过相机，UIImagePickerControllerSourceTypeCamera
        //获取方法3，通过相册（呈现全部图片），UIImagePickerControllerSourceTypeSavedPhotosAlbum
        PickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //允许编辑，即放大裁剪
        PickerImage.allowsEditing = YES;
        //自代理
        PickerImage.delegate = self;
        //页面跳转
        [self presentViewController:PickerImage animated:YES completion:nil];
    }]];
    //按钮：取消，类型：UIAlertActionStyleCancel
    [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"取消", nil) style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
