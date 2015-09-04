//
//  ShotViewController.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/4/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.


#import "ShotViewController.h"
#import "ShotModel.h"

@interface ShotViewController ()

@end

@implementation ShotViewController

@synthesize manager, shots,posts, pageCount, loading;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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
    
    NSDictionary *parameters = @{@"page": [@(page) stringValue]};
    
    [manager GET:@"http://api.dribbble.com/shots/popular" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //Conversão do JSON para array com objetos "shot"
        shots = [MTLJSONAdapter modelsOfClass:[ShotModel class] fromJSONArray:[responseObject objectForKey:@"shots"] error:nil];
        
        //impede que objetos duplicados sejam adicionados a tabela
        for (int i = 0; i < [shots count]; i++) {
            if (![posts containsObject:[shots objectAtIndex:i]])
                [posts addObject:[shots objectAtIndex:i]];
        }
        
        [[self tableView] reloadData]; //Recarrega a tabela com os dados atualizados
        [self.refreshControl endRefreshing];
        
        self.loading = false; //Flag pra impedir que o carregamento ocorra mais de uma vez simultaneamente
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Erro: %@",error);
    }];
    
}

#pragma mark - Métodos da tabela
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"replace" forIndexPath:indexPath];
    
    static NSString *shotCellIdentifier = @"shotCell";
    
//    ShotCell *cell = [self.tableView dequeueReusableCellWithIdentifier:shotCellIdentifier];
//    ShotModel *shot = [posts objectAtIndex:[indexPath row]];
//    cell.titleLabel.text = shot.title;
//    [cell.shotImage sd_setImageWithURL:shot.image
//                      placeholderImage:[UIImage imageNamed:placeholder]];
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
    
    if (y > h + distance && loading == false && pageCount < 50 && [shots count] == 15)
    {
        shots = nil;
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
