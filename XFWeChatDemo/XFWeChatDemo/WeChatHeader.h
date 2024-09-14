//
//  WeChatHeader.h
//  XFWeChatDemo
//
//  Created by Aron.Li on 2021/8/31.
//
#import <UIKit/UIKit.h>

@interface WCBizUtil : NSObject
+ (NSMutableDictionary *)dictionaryWithDecodedComponets:(id)arg1 separator:(id)arg2;
@end

@interface WARedEnvelopesReceiveHomeView
{
    id  m_delegate;
    NSDictionary *m_dicBaseInfo;
}
@end

@interface WCPayInfoItem
@property(retain, nonatomic) NSString *m_c2cNativeUrl;
@end

@interface CMessageWrap
@property(retain, nonatomic) WCPayInfoItem *m_oWCPayInfoItem;
@property(nonatomic) unsigned int m_uiMessageType;
@property(retain, nonatomic) NSString *m_nsFromUsr;
@end

@interface WCRedEnvelopesControlData
@property(retain, nonatomic) CMessageWrap *m_oSelectedMessageWrap;
@property(retain, nonatomic) NSDictionary *m_structDicRedEnvelopesBaseInfo;
@end

@interface WCRedEnvelopesReceiveControlLogic{
    WCRedEnvelopesControlData * m_data;
}
- (void)OpenRedEnvelopesRequest:(id)arg1;
- (void)reportReceiveHomeViewEmoticon;
- (bool)isOpenIMHongBao;
@end

@interface MMContext : NSObject
+ (id)currentContext;
- (id)getService:(Class)arg1;
@end

@interface MMMsgLogicManager
- (id)GetCurrentLogicController;
@end

@interface CContactMgr
- (id)getSelfContact;
@end

@interface CContact
- (id)getContactDisplayName;
@property(retain, nonatomic) NSString *m_nsHeadImgUrl;
@end

@interface CBaseContact
@property(retain, nonatomic) NSString *m_nsUsrName;
@end

@interface WeixinContentLogicController
@property(retain, nonatomic) CBaseContact *m_contact;
@end

@interface NSDictionary (WWKApiSafeCast)
- (id)stringForKey:(id)arg1;
@end

@interface WCPayLogicMgr : NSObject
- (void)setRealnameReportScene:(unsigned int)arg1;
- (void)checkHongbaoOpenLicense:(id)arg1 acceptCallback:(void(^)())arg2 denyCallback:(void(^)())arg3;
@end

@interface WCRedEnvelopesLogicMgr
- (void)OpenOpenIMRedEnvelopesRequest:(id)arg1;
- (void)OpenRedEnvelopesRequest:(id)arg1;
- (void)ReceiverQueryRedEnvelopesRequest:(id)arg1;
@end

@interface SKBuiltinBuffer_t
@property(retain, nonatomic) NSData *buffer;
@end

@interface HongBaoRes
@property(retain, nonatomic) SKBuiltinBuffer_t *retText;
@property(nonatomic) int cgiCmdid;
@end
