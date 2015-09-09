//
//  ViewController.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/4/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import "DetailsViewController.h"
#import "shotCell.h"
#import "DetailsCell.h"
#import "ShotViewController.h"
#import <UIImageView+WebCache.h>


@interface DetailsViewController ()


@end

@implementation DetailsViewController

static NSString *detailsCell = @"detailsCell";
static NSString *shotCellIdentifier = @"shotCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.tableView.dataSource = self;
//    self.tableView.delegate = self;
//    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Metodos da tabela
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    shotCell *cell = [self.tableView dequeueReusableCellWithIdentifier:shotCellIdentifier];
    cell.shotLabel.text = _shot.title;
    [cell.shotImage sd_setImageWithURL:_shot.image
                      placeholderImage:[UIImage imageNamed:placeholder]];
    cell.shotViewsCount.text = [_shot.views stringValue];
    cell.shotView.backgroundColor = [UIColor blackColor];
    cell.shotView.alpha = 0.7f;
    
    if (indexPath.row == 1)
    {
        DetailsCell *cell = [self.tableView
                             dequeueReusableCellWithIdentifier:detailsCell];
        cell.nameLabel.text = _shot.player.player_name;
        cell.descLabel.text = _shot.desc;
        cell.avatarImage.clipsToBounds = YES;
        cell.avatarImage.layer.cornerRadius = 20;
        [cell.avatarImage sd_setImageWithURL:_shot.player.player_image
                      placeholderImage:[UIImage imageNamed:placeholder]];
        
        return cell;
    }
    
    return cell;
}

#pragma mark - Metodos botoes navBar
- (IBAction)shareButton:(id)sender {
    //Bug iOS 8.3 - Facebook não faz compartilhamento de String
    
    NSString *title = _shot.title;
    if ([title length] == 0) title = @"";
    NSString *desc = _shot.desc;
    if ([desc length] == 0) desc = @"";
    NSURL *url = _shot.image;
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    if (image == nil) image = [UIImage imageNamed:placeholder];
    NSArray *activityItems = @[title,desc,image];
    
    
    UIActivityViewController *share = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    
    NSArray *exclude = @[UIActivityTypeAddToReadingList,UIActivityTypeAirDrop,UIActivityTypeAssignToContact,UIActivityTypeCopyToPasteboard,UIActivityTypeMail,UIActivityTypeMessage,UIActivityTypePostToFlickr,UIActivityTypePostToTencentWeibo,UIActivityTypePostToVimeo,UIActivityTypePostToWeibo,UIActivityTypePrint,UIActivityTypeSaveToCameraRoll];
    
    share.excludedActivityTypes = exclude;
    
    [self presentViewController:share animated:YES completion:nil];
}

@end
