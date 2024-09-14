//
//  WeChatRedEnvelopParamQueue.m
//  XFWeChatDemo
//
//  Created by Aron.Li on 2021/8/31.
//

#import "WeChatRedEnvelopParamQueue.h"

@interface WeChatRedEnvelopParamQueue ()
@property(nonatomic, strong) NSMutableArray* queue;
@end

@implementation WeChatRedEnvelopParamQueue

static WeChatRedEnvelopParamQueue * queue = nil;

+ (instancetype)sharedQueue{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = [[WeChatRedEnvelopParamQueue alloc] init];
    });
    return  queue;
}

-(instancetype)init{
    if (self = [super init]) {
        _queue = [[NSMutableArray alloc] init];
    }
    return  self;
}

-(void)enqueue:(NSMutableDictionary *)param{
    [self.queue addObject:param];
}

-(NSMutableDictionary *)dequeue{
    if (self.queue.count == 0 && !self.queue.firstObject) {
        return nil;
    }
    NSMutableDictionary * first = self.queue.firstObject;
    NSLog(@"数组里面的数据count:%lu",(unsigned long)self.queue.count);
    [self.queue removeObjectAtIndex:0];
    return  first;
}

@end
