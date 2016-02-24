//
//  ViewController.m
//  BlockDemo
//
//  Created by offshoreadmin on 23/02/2016.
//  Copyright © 2016 simplyhired. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSString *(^whatTheF)(NSString *, NSString *);
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  int (^firstBlock)(NSString *param1, int param2);
  void (^showName)(NSString *myName);

  int (^howMany)(int, int);
  NSString *(^composeName)(NSString *, NSString *);
  
  howMany = ^(int a, int b) {
    return a * b;
  };
  
  _whatTheF = ^(NSString *first, NSString *second) {
      return @"abs";
  };
  
  composeName = ^(NSString *first, NSString *second) {
    return [[first stringByAppendingString:@" "] stringByAppendingString:second];
  };
  
  float results = ^(float value1, float value2, float value3){
    return value1 * value2 * value3;
  } (1.2, 3.4, 5.6);
  
  NSLog(@"%f", results);
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
