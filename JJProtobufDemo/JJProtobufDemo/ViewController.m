//
//  ViewController.m
//  JJProtobufDemo
//
//  Created by Liu on 2019/4/25.
//  Copyright © 2019年 Liu. All rights reserved.
//

#import "ViewController.h"
#import "JJPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *person = [Person new];
    person.userName = @"Jerry";  // T 0A L 05 V 4A 65 72 72 79
    person.userAge = 18; // T 10 V 12
    
    NSLog(@"Person = %@", [person data]);
}


@end
