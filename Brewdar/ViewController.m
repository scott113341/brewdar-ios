//
//  ViewController.m
//  Brewdar
//
//  Created by Scott Hardy on 10/8/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "ViewController.h"
#import "Device.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RLMArray *devices = [Device allObjects];
    NSLog(@"%lu devices", (unsigned long)devices.count);
    
    Device *device = [Device thisDevice];
    NSLog(@"thisDevice: %@", device);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
