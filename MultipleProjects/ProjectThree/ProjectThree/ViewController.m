//
//  ViewController.m
//  ProjectThree
//
//  Created by offshoreadmin on 01/03/2016.
//  Copyright © 2016 simplyhired. All rights reserved.
//

#import "ViewController.h"
#import <MyObjectiveCFramework/MyClass.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  MyClass *class = [MyClass new];
  class.name = @"Paul";
  [class greetings];
  [class greetWorld];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
