//
//  ListModel.h
//  XIBZSYDemo
//
//  Created by Lindon on 2019/11/12.
//  Copyright © 2019 Lindon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListModel : NSObject

@property (copy,nonatomic) NSString *name;
@property (copy,nonatomic) NSString *content;

@property (assign,nonatomic) BOOL isClose;



@end

NS_ASSUME_NONNULL_END
