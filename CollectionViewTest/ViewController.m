//
//  ViewController.m
//  CollectionViewTest
//
//  Created by 雷传营 on 16/6/1.
//  Copyright © 2016年 BrotherCompany. All rights reserved.
//

#import "ViewController.h"
#import "CommonViewController.h"
#import "WaterFallController.h"
#import "CircleViewController.h"
#import "PickViewController.h"
#import "BallViewController.h"

@interface ViewController ()

@property (nonatomic,retain) UIButton *commonButton;
@property (nonatomic,retain) UIButton *waterFallButton;
@property (nonatomic,retain) UIButton *cilcleButton;
@property (nonatomic,retain) UIButton *pickButton;
@property (nonatomic,retain) UIButton *ballButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.commonButton];
    [self.view addSubview:self.waterFallButton];
    [self.view addSubview:self.cilcleButton];
    [self.view addSubview:self.pickButton];
     [self.view addSubview:self.ballButton];
}


-(UIButton *)waterFallButton{
    
    if (!_waterFallButton) {
        _waterFallButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _waterFallButton.frame = CGRectMake(50, 150, 150, 30);
        [_waterFallButton setTitle:@"瀑布流" forState:UIControlStateNormal];
        [_waterFallButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_waterFallButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        _waterFallButton.tag = 101;
    }
    return _waterFallButton;
}



-(UIButton *)commonButton{

    if (!_commonButton) {
        _commonButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _commonButton.frame = CGRectMake(50, 100, 150, 30);
        [_commonButton setTitle:@"普通Collection" forState:UIControlStateNormal];
        [_commonButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_commonButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        _commonButton.tag = 100;
    }
    return _commonButton;
}

-(UIButton *)cilcleButton{
    
    if (!_cilcleButton) {
        _cilcleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cilcleButton.frame = CGRectMake(50, 200, 150, 30);
        [_cilcleButton setTitle:@"环形" forState:UIControlStateNormal];
        [_cilcleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cilcleButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        _cilcleButton.tag = 102;
    }
    return _cilcleButton;
}



-(UIButton *)pickButton{
    if (!_pickButton) {
        _pickButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _pickButton.frame = CGRectMake(50, 250, 150, 30);
        [_pickButton setTitle:@"立方形" forState:UIControlStateNormal];
        [_pickButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_pickButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        _pickButton.tag = 103;
    }
    return _pickButton;

}


-(UIButton *)ballButton{
    if (!_ballButton) {
        _ballButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _ballButton.frame = CGRectMake(50, 300, 150, 30);
        [_ballButton setTitle:@"球形" forState:UIControlStateNormal];
        [_ballButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_ballButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        _ballButton.tag = 104;
    }
    return _ballButton;



}

-(void)click:(UIButton *)sender{

    if (sender.tag == 100) {
        CommonViewController * CVC = [[CommonViewController alloc]init];
        [self.navigationController pushViewController:CVC animated:YES];
    }else if (sender.tag == 101){
        WaterFallController * WVC  = [[WaterFallController alloc]init];
        [self.navigationController pushViewController:WVC animated:YES];
    
    }else if(sender.tag == 102){
        CircleViewController * CirVC = [[CircleViewController alloc]init];
        [self.navigationController pushViewController:CirVC animated:YES];
    
    }else if(sender.tag == 103){
        
        PickViewController * PVC = [[PickViewController alloc]init];
        [self.navigationController pushViewController:PVC animated:YES];
    
    }else{
        BallViewController * BVC =[[BallViewController alloc]init];
        [self.navigationController pushViewController:BVC animated:YES];
        
    }

}


@end
