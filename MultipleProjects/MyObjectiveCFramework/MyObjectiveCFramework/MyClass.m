//
//  MyClass.m
//  MyObjectiveCFramework
//
//  Created by offshoreadmin on 01/03/2016.
//  Copyright © 2016 simplyhired. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

- (void)greetings {
  NSString *message = [NSString stringWithFormat:@"Hello, %@", self.name];
  NSLog(@"%@", message);
}

- (void)greetWorld {
  NSLog(@"Hello, world!");
}

@end
