//
//  QNAHomeController.m
//  QNADiploma
//
//  Created by Zhanserik Kenes on 21.02.15.
//  Copyright (c) 2015 Zhans Inc. All rights reserved.
//

#import "QNAHomeViewController.h"
#import "QNAQuestionTableViewCell.h"

@interface QNAHomeViewController() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) UISearchBar *searchBar;
@property (nonatomic) UITableView *tableView;
@end


@implementation QNAHomeViewController

@synthesize searchBar = _searchBar;
@synthesize tableView = _tableView;

#pragma mark - UIViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"Home"];
    
    _tableView = [UITableView new];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 44;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.view addSubview:_tableView];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_tableView]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_tableView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_tableView]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_tableView)]];
    
    _searchBar = [UISearchBar new];
    _searchBar.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 39);
    _searchBar.tintColor = [UIColor gk_redColor];
    _searchBar.barTintColor = [UIColor gk_redColor];
    
    _tableView.tableHeaderView = _searchBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



#pragma mark - SlidingNavigationController Delegate

- (BOOL)slideNavigationControllerShouldDisplayRightMenu{
    return NO;
}
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu{
    return YES;
}

#pragma mark - UITableView Delegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - UITableView Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"UITableViewCell";
    
    QNAQuestionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell){
        cell = [[QNAQuestionTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                               reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = @"How to wake early everyday something?";
    cell.detailTextLabel.text = @"#life #morning #design #java #arai";
    
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

@end
