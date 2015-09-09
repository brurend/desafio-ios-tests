//
//  ShotViewController.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/4/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.


#import "ShotViewController.h"
#import "ShotModel.h"
#import "NetworkingController.h"
#import "shotCell.h"
#import <UIImageView+WebCache.h>
#import "DetailsViewController.h"

@interface ShotViewController ()

@end

@implementation ShotViewController
NSString* const placeholder = @"placeholder.png";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 250;
    self.navigationItem.title = @"Shots view";
    
    _manager = [AFHTTPRequestOperationManager manager];
    _posts = [[NSMutableArray alloc] init];
    [self refreshView];
    _pageCount = 1;

    [self loadPosts:_pageCount];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Metodos do pull to refresh
//Prepara o Pull to refresh
-(void)refreshView
{
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refreshAction) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
}

//Executa o Pull to refresh
-(void)refreshAction
{
    [self.posts removeAllObjects];
    [self.tableView reloadData];  //Sem isto não funciona, pq?
    _pageCount = 1;
    [self loadPosts:_pageCount];
}

#pragma mark - Métodos para popular o array
-(void) loadPosts:(int)page{

    [self.refreshControl beginRefreshing];
    
    NSString *json = @"http://api.dribbble.com/shots/popular";
    NSDictionary *parameters = @{@"page": [@(page) stringValue]};
    
    [[NetworkingController sharedInstance]getShot:json parameters:parameters success:^(NSArray *shot) {
        [self.posts addObjectsFromArray:shot];
        [self.tableView reloadData];
    } failure:^(NSError *erro) {
        NSLog(@"%@",erro);
    }];

    [self.refreshControl endRefreshing];
}

#pragma mark - Métodos da tabela
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.posts count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *shotCellIdentifier = @"shotCell";
    
    shotCell *cell = [tableView dequeueReusableCellWithIdentifier:shotCellIdentifier];
    ShotModel *shot = [_posts objectAtIndex:[indexPath row]];
    NSLog(@"%@", shot.title);
    cell.shotLabel.text = shot.title;
    
    [cell.shotImage sd_setImageWithURL:shot.image
                      placeholderImage:[UIImage imageNamed:placeholder]];
    cell.shotViewsCount.text = [shot.views stringValue];
    cell.shotView.backgroundColor = [UIColor blackColor];
    cell.shotView.alpha = 0.7f;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self.posts count]-3){
        [self loadPosts:self.pageCount++];
    }
}

#pragma mark - Metodos de transição
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailsSegue"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailsViewController *dvc = segue.destinationViewController;
        dvc.shot = [self.posts objectAtIndex:indexPath.row];
    }
}




@end
