//
//  ShotViewController.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/4/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.


#import "ShotViewController.h"
#import "ShotModel.h"
#import "ShotController.h"
#import "shotCell.h"
#import <UIImageView+WebCache.h>

@interface ShotViewController ()

@end

@implementation ShotViewController
NSString* const placeholder = @"placeholder.png";

@synthesize manager, shots,posts, pageCount, loading;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 250;
    self.navigationItem.title = @"Shots view";
    
    manager = [AFHTTPRequestOperationManager manager];
    shots = [[NSArray alloc] init];
    posts = [[NSMutableArray alloc] init];
    [self refreshView];
    pageCount = 1;

    [self loadPosts:pageCount];

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
    [posts removeAllObjects];
    pageCount = 1;
    [self loadPosts:pageCount];
}

#pragma mark - Métodos para popular o array
-(void) loadPosts:(int)page{

    [self.refreshControl beginRefreshing];
    
    NSString *json = @"http://api.dribbble.com/shots/popular";
    NSDictionary *parameters = @{@"page": [@(page) stringValue]};
    
    [[ShotController sharedInstance]test:json parameters:parameters success:^(NSArray *shot) {
        [posts addObjectsFromArray:shot];
        [self.tableView reloadData];
    }];
    
    [self.refreshControl endRefreshing];
    self.loading = false;
    
}

#pragma mark - Métodos da tabela
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [posts count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *shotCellIdentifier = @"shotCell";
    
    shotCell *cell = [tableView dequeueReusableCellWithIdentifier:shotCellIdentifier];
    ShotModel *shot = [posts objectAtIndex:[indexPath row]];
    cell.shotLabel.text = shot.title;
    
    [cell.shotImage sd_setImageWithURL:shot.image
                      placeholderImage:[UIImage imageNamed:placeholder]];
//    cell.viewsLabel.text = [shot.views stringValue];
//    cell.fundoView.backgroundColor = [UIColor blackColor];
//    cell.fundoView.alpha = 0.7f;
    
    return cell;
}

//Quando chega no fim da tela carrega a próxima página de shots (Scroll infinito)
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //Limites da tela
    CGPoint offset = self.tableView.contentOffset;
    CGRect bounds = self.tableView.bounds;
    CGSize size = self.tableView.contentSize;
    UIEdgeInsets inset = self.tableView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    
    //Distância antes do fim para carregar antes de chegar completamente até o fundo
    float distance = -100;
    
    if (y > h + distance && loading == false && pageCount < 50)
    {
        loading = true;
        [self loadPosts:++pageCount];
    }
}

#pragma mark - Metodos de transição
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"descriptionSegue"])
//    {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        DescriptionViewController *dvc = segue.destinationViewController;
//        dvc.shot = [posts objectAtIndex:indexPath.row];
//    }
//}




@end
