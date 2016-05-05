//
//  ViewController.m
//  SystemSound
//
//  Created by leafy on 16/5/5.
//  Copyright © 2016年 leafy. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _dataSource = [NSMutableArray array];
        for (int i = 1000; i < 1037; i++) {
            [_dataSource addObject:@(i)];
        }
        for (int i = 1050; i < 1058; i++) {
            [_dataSource addObject:@(i)];
        }
        for (int i = 1070; i < 1076; i++) {
            [_dataSource addObject:@(i)];
        }
        for (int i = 1100; i < 1155; i++) {
            [_dataSource addObject:@(i)];
        }
        for (int i = 1200; i < 1260; i++) {
            [_dataSource addObject:@(i)];
        }
        for (int i = 1300; i < 1316; i++) {
            [_dataSource addObject:@(i)];
        }
        for (int i = 1320; i < 1337; i++) {
            [_dataSource addObject:@(i)];
        }
        [_dataSource addObject:@(1350)];
        [_dataSource addObject:@(1351)];
        [_dataSource addObject:@(4095)];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setupTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", _dataSource[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SystemSoundID id = [_dataSource[indexPath.row] intValue];
    AudioServicesPlaySystemSound(id);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
