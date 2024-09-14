//
//  WeChatRedEnvelopParamQueue.h
//  XFWeChatDemo
//
//  Created by Aron.Li on 2021/8/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeChatRedEnvelopParamQueue : NSObject

+ (instancetype)sharedQueue;
- (void)enqueue:(NSMutableDictionary *)param;
- (NSMutableDictionary *)dequeue;

@end

NS_ASSUME_NONNULL_END
