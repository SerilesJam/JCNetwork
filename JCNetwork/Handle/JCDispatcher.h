//
//  JCDispatcher.h
//  JCNetworkNew
//
//  Created by Jam on 13-6-21.
//  Copyright (c) 2013年 Jam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCServiceHeader.h"
#import "JCOperationResponse.h"
#import "DispatchElement.h"
#import "JCNetworkResponse.h"

@interface JCDispatcher : NSObject
{
    NSMutableDictionary *_serviceDict;
    NSMutableDictionary *_dispatchTable;
    //自定义post超时处理，apple定义默认超时240s
    NSMutableDictionary *_timeoutDict;
}

@property (nonatomic, readonly) NSMutableDictionary *serviceDict;

+ (id)sharedInstance;
- (id)init;

- (void)addDispatchItem:(DispatchElement *)item;
- (void)cancelRequest:(JCRequestID)requestID;

//根据requestID获取分发Item
- (DispatchElement *)getDispatchElement:(JCRequestID)requestID;
- (void)onUploadDispatchItem:(DispatchElement *)item;
- (void)onDownloadDispatchItem:(DispatchElement *)item;

- (void)requestFinished:(JCOperationResponse *)operationResponse;
- (void)requestFailed:(JCOperationResponse *)operationResponse withError:(NSError *)error;

- (void)dispatchResponse:(JCNetworkResponse *)response forElement:(DispatchElement *)element;

//factory method
- (MKNetworkEngine *)createRequestQueueWith:(JCBaseService *)service;

@end