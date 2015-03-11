//
//  PhotoCell.m
//  PuppyBombs
//
//  Created by Calvin Nisbet on 2015-03-09.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import "PhotoCell.h"
#import "PhotoController.h"

@implementation PhotoCell


-(void)setPhoto:(NSDictionary *)photo
{
    _photo = photo;
   [PhotoController imageForPhoto:photo size:@"thumbnail" completion:^(UIImage *image) {
       self.imageView.image = image;
   }];
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
        
        
        //I DON"T KNOW IF YOU REALIZED THIS CALVIN, BUT YOU COULD USE THE SNAP INTO PLACE BEHAVIOR FOR A TINDER-LIKE SWIPING ACTION, MUDDAFUGGA.
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(like:)];
        longPress.minimumPressDuration = 1.0f;
        [self addGestureRecognizer:longPress];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}


-(void)layoutSubviews
{
    self.imageView.frame = self.contentView.bounds;
}


- (void)like:(id)sender
{
    
    UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)sender;
    if (longPress.state == UIGestureRecognizerStateEnded) {
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSString *accessToken = [[NSUserDefaults  standardUserDefaults] objectForKey:@"accessToken"];
        NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.instagram.com/v1/media/%@/likes?access_token=%@", self.photo[@"id"], accessToken];
        NSURL *url = [[NSURL alloc] initWithString:urlString];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
        request.HTTPMethod = @"POST";
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self showLikeCompletion];
            });
        }];
        [dataTask resume];
    }
}



- (void)showLikeCompletion
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hated!" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [alert show];
    
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds) * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        [alert dismissWithClickedButtonIndex:0 animated:YES];
    });
}


@end
//when me and roommate used to put before class - cof