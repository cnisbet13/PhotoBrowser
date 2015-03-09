//
//  PhotoCell.m
//  PuppyBombs
//
//  Created by Calvin Nisbet on 2015-03-09.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import "PhotoCell.h"
#import <SAMCache/SAMCache.h>

@implementation PhotoCell


-(void)setPhoto:(NSDictionary *)photo
{
    _photo = photo;
    NSURL *url = [[NSURL alloc] initWithString:_photo[@"images"][@"thumbnail"][@"url"]];
    [self downloadPhotoWithURL:url];
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}


-(void)layoutSubviews
{
    self.imageView.frame = self.contentView.bounds;
}


-(void)downloadPhotoWithURL:(NSURL*)url
{
    NSString *key = [[NSString alloc] initWithFormat:@"%@-thumbnail", self.photo[@"id"]];
    UIImage *photo = [[SAMCache sharedCache] imageForKey:key];
    if (photo) {
        self.imageView.image = photo;
        return;
    }
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        NSData *data = [[NSData alloc] initWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc] initWithData:data];
        [[SAMCache sharedCache] setImage:image forKey:key];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
        });
    }];
    [downloadTask resume];
}

@end
//when me and roommate used to put before class - cof