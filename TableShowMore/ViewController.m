//
//  ViewController.m
//  TableShowMore
//
//  Created by 老胡 on 15/1/29.
//  Copyright (c) 2015年 老胡. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    int index;
}

@end

@implementation ViewController

-(void)loadView{
    [super loadView];
    index = -1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == index) {
        return 44;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(200, 0, 120, 44)];
    btn.tag = section;
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitle:[NSString stringWithFormat:@"第%d组信息",(int)section+1] forState:0];
    [btn addTarget:self action:@selector(changeinfo:) forControlEvents:UIControlEventTouchDown];
    [view addSubview:btn];
    return view;
}

-(void)changeinfo:(id)sender{
    if (index < 0) {
        index = (int)[sender tag];
    }else if(index == [sender tag]){
        index = -1;
    }else{
        index = (int)[sender tag];
    }
//    index = (int)[sender tag];
    [_tableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 12;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == index) {
        return 5;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = [NSString stringWithFormat:@"第%d组第%d行",(int)indexPath.section+1,(int)indexPath.row + 1];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

@end
