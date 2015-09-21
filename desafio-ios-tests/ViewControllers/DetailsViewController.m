//
//  ViewController.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/4/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import "DetailsViewController.h"
#import "ShotCell.h"
#import "DetailsCell.h"
#import "ShotViewController.h"
#import <UIImageView+WebCache.h>
#import "NSString+StripHTML.h"

#import <CoreSpotlight/CoreSpotlight.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface DetailsViewController ()


@end

@implementation DetailsViewController

static NSString *detailsCell = @"detailsCell";
static NSString *shotCellIdentifier = @"shotCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 250.0f;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.view.frame = CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width, self.tableView.frame.size.height);
//    [self search];
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
    
    ShotCell *cell = [self.tableView dequeueReusableCellWithIdentifier:shotCellIdentifier];
    NSRange titleRange = {0, MIN([_shot.title length], 30)};
    NSString *shortTitle = [_shot.title substringWithRange:titleRange];
    cell.shotLabel.text = shortTitle;
    [cell.shotImage sd_setImageWithURL:_shot.image
                      placeholderImage:[UIImage imageNamed:placeholder]];
    cell.shotViewsCount.text = [_shot.views stringValue];

    
    
    if (indexPath.row == 1)
    {
        DetailsCell *cell = [self.tableView
                             dequeueReusableCellWithIdentifier:detailsCell];
        cell.nameLabel.text = _shot.player.player_name;
        cell.descLabel.text = [_shot.desc removeTags];
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
    
    NSString *title = _shot.title;
    if ([title length] == 0) title = @"";
    NSString *desc = _shot.description;
    if ([desc length] == 0) desc = @"";
    NSURL *url = _shot.image;
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    if (image == nil) image = [UIImage imageNamed:placeholder];
    NSArray *activityItems = @[title,desc,image];
    NSMutableArray *Items = [NSMutableArray arrayWithArray:activityItems];
    
    UIActivityViewController *share = [[UIActivityViewController alloc] initWithActivityItems:Items applicationActivities:nil];
    
    NSArray *exclude = @[UIActivityTypeAddToReadingList,UIActivityTypeAirDrop,UIActivityTypeAssignToContact,UIActivityTypeCopyToPasteboard,UIActivityTypeMail,UIActivityTypeMessage,UIActivityTypePostToFlickr,UIActivityTypePostToTencentWeibo,UIActivityTypePostToVimeo,UIActivityTypePostToWeibo,UIActivityTypePrint,UIActivityTypeSaveToCameraRoll];
    
    share.excludedActivityTypes = exclude;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [self presentViewController:share animated:YES completion:nil];
    }
    else {
        UIPopoverController *popup = [[UIPopoverController alloc] initWithContentViewController:share];
        [popup presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) return 250.0f;
    else return UITableViewAutomaticDimension;
}

//-(void)search{
//    self.activity = [[NSUserActivity alloc] initWithActivityType:@"com.cs.teste"];
//    NSRange titleRange = {0, MIN([_shot.title length], 90)};
//    NSString *shortTitle = [_shot.title substringWithRange:titleRange];
//    self.activity.title = shortTitle;
////    self.activity.userInfo = @{@"title":_shot.title, @"description":_shot.desc,@"image":_shot.image};
//    NSSet<NSString *> *set = [[NSSet alloc] initWithArray:@[@"dribble",@"shots",@"design",@"designers"]];
//    self.activity.keywords = set;
//    self.activity.eligibleForSearch = true;
//    
//    
//    CSSearchableItemAttributeSet *attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString*)kUTTypeImage];
//
//    attributeSet.title = shortTitle;
//    NSRange descRange = {0, MIN([_shot.desc length],300)};
//    NSString *shortDesc = [_shot.desc substringWithRange:descRange];
//    attributeSet.contentDescription = shortDesc;
//    NSURL *url = _shot.image;
//    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
//    NSData *data = UIImagePNGRepresentation(image);
//    attributeSet.thumbnailData = data;
//    
//    self.activity.contentAttributeSet = attributeSet;
//    [self.activity becomeCurrent];
//    
//
//}

@end
