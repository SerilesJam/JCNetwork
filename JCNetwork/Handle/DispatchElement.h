//
//  DispatchElement.h
//  JCNetworkNew
//
//  Created by Jam on 13-6-23.
//  Copyright (c) 2013年 Jam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCRequestProxy.h"

@interface DispatchElement : NSObject

@property (nonatomic, assign) JCRequestID requestID;
@property (nonatomic, copy) JCNetworkResponseBlock responseBlock;
@property (nonatomic, assign) JCRequest *request;
@property (nonatomic, strong) NSString *entityClassName;


- (id)init;

@end
