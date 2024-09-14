#line 1 "/Users/Aronm1/XFWeChatDemo/XFWeChatDemo/logMethodCMessagemgr.xm"
#import <UIKit/UIKit.h>
#import "WeChatHeader.h"
#import "WeChatRedEnvelopParamQueue.h"













































































































































































































































































































































































































































































































































#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class MMContext; @class NSMutableDictionary; @class CMessageMgr; @class WCRedEnvelopesLogicMgr; @class WCBizUtil; @class CContactMgr; 
static void (*_logos_orig$_ungrouped$CMessageMgr$AsyncOnAddMsg$MsgWrap$)(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, id, CMessageWrap *); static void _logos_method$_ungrouped$CMessageMgr$AsyncOnAddMsg$MsgWrap$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, id, CMessageWrap *); static void (*_logos_orig$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$)(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesLogicMgr* _LOGOS_SELF_CONST, SEL, HongBaoRes *, id); static void _logos_method$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesLogicMgr* _LOGOS_SELF_CONST, SEL, HongBaoRes *, id); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCRedEnvelopesLogicMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCRedEnvelopesLogicMgr"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MMContext(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MMContext"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCBizUtil(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCBizUtil"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$NSMutableDictionary(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("NSMutableDictionary"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CContactMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CContactMgr"); } return _klass; }
#line 528 "/Users/Aronm1/XFWeChatDemo/XFWeChatDemo/logMethodCMessagemgr.xm"

static void _logos_method$_ungrouped$CMessageMgr$AsyncOnAddMsg$MsgWrap$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, CMessageWrap * msgWrap){
    NSLog(@"m_nsFromUsr:%@", msgWrap.m_nsFromUsr);
    NSString *NativeUrl2 = msgWrap.m_oWCPayInfoItem.m_c2cNativeUrl;
    if ((msgWrap.m_uiMessageType == 49)
        && [NativeUrl2 containsString:@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?"]) {  
         NSString *m_c2cNativeUrl = msgWrap.m_oWCPayInfoItem.m_c2cNativeUrl;
        
        NSUInteger len = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
        NSString *NativeUrl2 = [m_c2cNativeUrl substringFromIndex:len];
        NSMutableDictionary *url_dic = [_logos_static_class_lookup$WCBizUtil() dictionaryWithDecodedComponets:NativeUrl2 separator:@"&"];
        NSMutableDictionary *mutable_dic = [_logos_static_class_lookup$NSMutableDictionary() dictionary];
        [mutable_dic setObject:@"1" forKey:@"msgType"];
        [mutable_dic setObject:url_dic[@"sendid"] forKey:@"sendId"];
        [mutable_dic setObject:url_dic[@"channelid"] forKey:@"channelId"];
        
        MMContext * context = [_logos_static_class_lookup$MMContext() currentContext];
        Class ccMgr = [_logos_static_class_lookup$CContactMgr() class];
        CContactMgr *contactMgr = [context getService:ccMgr];
        CContact *selfContact = [contactMgr getSelfContact];
        id displayName = [selfContact getContactDisplayName];
        [mutable_dic setObject:displayName forKey:@"nickName"];
        [mutable_dic setObject:[selfContact m_nsHeadImgUrl] forKey:@"headImg"];
        if(msgWrap){
            WCPayInfoItem * payInfoItem = [msgWrap m_oWCPayInfoItem];
            [mutable_dic setObject:[payInfoItem m_c2cNativeUrl] forKey:@"nativeUrl"];
        }
        
        [mutable_dic setObject:msgWrap.m_nsFromUsr forKey:@"sessionUserName"];
        
        [[WeChatRedEnvelopParamQueue sharedQueue] enqueue:mutable_dic];
        
        
        NSMutableDictionary * params = [_logos_static_class_lookup$NSMutableDictionary() dictionary];
        [params setObject:@"0" forKey:@"agreeDuty"];
        [params setObject:mutable_dic[@"channelId"] forKey:@"channelId"];
        [params setObject:@"1" forKey:@"inWay"];
        [params setObject:mutable_dic[@"msgType"] forKey:@"msgType"];
        [params setObject:mutable_dic[@"nativeUrl"] forKey:@"nativeUrl"];
        [params setObject:mutable_dic[@"sendId"] forKey:@"sendId"];
        
        WCRedEnvelopesLogicMgr * redMgr = [[_logos_static_class_lookup$MMContext() currentContext] getService:[_logos_static_class_lookup$WCRedEnvelopesLogicMgr() class]];
        
        [redMgr ReceiverQueryRedEnvelopesRequest:params];
    } else {
        _logos_orig$_ungrouped$CMessageMgr$AsyncOnAddMsg$MsgWrap$(self, _cmd, arg1, msgWrap);
    }
    _logos_orig$_ungrouped$CMessageMgr$AsyncOnAddMsg$MsgWrap$(self, _cmd, arg1, msgWrap);
}




static void _logos_method$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesLogicMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, HongBaoRes * arg1, id arg2){
    
    NSError *err;
    NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:arg1.retText.buffer options:(NSJSONReadingMutableContainers) error:&err];
    
    NSString * hbStatus = responseDict[@"hbStatus"];
    if(nil != arg1 && 2 == hbStatus.intValue) {
        
        NSString * timingIdentifier = responseDict[@"timingIdentifier"];
        NSMutableDictionary *param = [[WeChatRedEnvelopParamQueue sharedQueue] dequeue];
        if(param) {
            [param setObject:timingIdentifier forKey:@"timingIdentifier"];
            NSLog(@"有参数：%@",param);
            WCRedEnvelopesLogicMgr * redEnvelopesLogicMgr = [[_logos_static_class_lookup$MMContext() currentContext] getService:[_logos_static_class_lookup$WCRedEnvelopesLogicMgr() class]];
            
            [redEnvelopesLogicMgr OpenRedEnvelopesRequest:param];
        }
    }
    _logos_orig$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$(self, _cmd, arg1, arg2);
}





























static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CMessageMgr = objc_getClass("CMessageMgr"); { MSHookMessageEx(_logos_class$_ungrouped$CMessageMgr, @selector(AsyncOnAddMsg:MsgWrap:), (IMP)&_logos_method$_ungrouped$CMessageMgr$AsyncOnAddMsg$MsgWrap$, (IMP*)&_logos_orig$_ungrouped$CMessageMgr$AsyncOnAddMsg$MsgWrap$);}Class _logos_class$_ungrouped$WCRedEnvelopesLogicMgr = objc_getClass("WCRedEnvelopesLogicMgr"); { MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesLogicMgr, @selector(OnWCToHongbaoCommonResponse:Request:), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$);}} }
#line 630 "/Users/Aronm1/XFWeChatDemo/XFWeChatDemo/logMethodCMessagemgr.xm"
