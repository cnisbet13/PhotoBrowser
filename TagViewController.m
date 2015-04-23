//
//  TagViewController.m
//  PuppyBombs
//
//  Created by Calvin Nisbet on 2015-03-17.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import "TagViewController.h"
#import <AKPickerView.h>

@interface TagViewController () <AKPickerViewDataSource, AKPickerViewDelegate>
@property (nonatomic, strong) AKPickerView *pickerView;
@property (nonatomic, strong) NSArray *titles;
@end

@implementation TagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pickerView = [[AKPickerView alloc] initWithFrame:self.view.bounds];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.pickerView];
    
    self.pickerView.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    self.pickerView.highlightedFont = [UIFont fontWithName:@"HelveticaNeue" size:20];
    self.pickerView.interitemSpacing = 20.0;
    self.pickerView.fisheyeFactor = 0.001;
    self.pickerView.pickerViewStyle = AKPickerViewStyle3D;

    
    self.titles = @[@"funnytext",
                    @"geekfun",
                    @"funnymeme",
                    @"funnydog",
                    @"funnycat",
                    @"trainstationart",
                    @"below10kfeet"];
    
    [self.pickerView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
    // Dispose of any resources that can be recreated.
}

-(NSUInteger)numberOfItemsInPickerView:(AKPickerView *)pickerView
{
    return [self.titles count];
}


-(NSString *)pickerView:(AKPickerView *)pickerView titleForItem:(NSInteger)item
{
   return self.titles[item];
}

-(void)pickerView:(AKPickerView *)pickerView didSelectItem:(NSInteger)item
{
    NSLog(@"%@", self.titles[item]);
}






@end
