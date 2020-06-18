//
//  ViewController.m
//  FFTimeTouch
//
//  Created by fans on 2020/6/16.
//  Copyright © 2020 com.glority. All rights reserved.
//

#import "ViewController.h"
#import "FFTimeTouch.h"

@interface ViewController ()

@property (nonatomic, strong) FFEventQueue *queue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.queue = [FFEventQueue new];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    FFEvent *ffEvet = [FFEvent touchWithConflictTime:1.f
                                                block:^{
                                                    NSLog(@"执行咯");
                                                }
                                                conflictBlock:^{
                                                    NSLog(@"我被冲突咯");
                                                }];

    [self.queue addTouch:ffEvet];
}


@end
