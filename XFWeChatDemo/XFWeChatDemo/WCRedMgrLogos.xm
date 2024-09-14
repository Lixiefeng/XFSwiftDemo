@interface WCRedEnvelopesGetShowResourcesCgi
@end
@interface ContactUpdateHelper
@end
/*
%hook WCRedEnvelopesLogicMgr
//- (void).cxx_destruct { %log; %orig; }
- (void)setGetShowResourcesCgi:(WCRedEnvelopesGetShowResourcesCgi *)getShowResourcesCgi { %log; %orig; }
- (WCRedEnvelopesGetShowResourcesCgi *)getShowResourcesCgi { %log; WCRedEnvelopesGetShowResourcesCgi * r = %orig; NSLog(@" = %@", r); return r; }
- (void)setM_senderNickNameHelper:(ContactUpdateHelper *)m_senderNickNameHelper { %log; %orig; }
- (ContactUpdateHelper *)m_senderNickNameHelper { %log; ContactUpdateHelper * r = %orig; NSLog(@" = %@", r); return r; }
- (void)onWCRedEnvelopesGetShowResourcesCgiError:(id)arg1 errorCode:(unsigned int)arg2 { %log; %orig; }
- (void)onWCRedEnvelopesGetShowResourcesCgiResponseOK:(id)arg1 type:(unsigned int)arg2 { %log; %orig; }
- (void)predownloadHongBaoShowResource { %log; %orig; }
- (void)AsyncBizSubcribeRequest:(id)arg1 { %log; %orig; }
- (void)CheckAuthBizEnterpriseRedEnvelopesRequest:(id)arg1 { %log; %orig; }
- (void)OpenBizEnterpriseRedEnvelopesRequest:(id)arg1 { %log; %orig; }
- (void)ReceiveBizEnterpriseRedEnvelopesRequest:(id)arg1 { %log; %orig; }
- (void)OpenEnterpriseRedEnvelopesRequest:(id)arg1 SendKey:(id)arg2 ShouldSubscribe:(_Bool)arg3 { %log; %orig; }
- (void)ThanksForRedEnvelopesRequest:(id)arg1 { %log; %orig; }
- (void)ClearserSendOrReceiveRedEnveloperListRequest:(id)arg1 { %log; %orig; }
- (void)DeleteRedEnvelopesRecord:(id)arg1 { %log; %orig; }
- (void)QueryUserSendOrReceiveRedEnveloperListRequest:(id)arg1 { %log; %orig; }
- (void)QueryRedEnvelopesDetailRequest:(id)arg1 { %log; %orig; }
- (void)OpenRedEnvelopesRequest:(id)arg1 { %log; %orig; }
- (void)QueryOpenIMRedEnvelopesDetailRequest:(id)arg1 { %log; %orig; }
- (void)OpenOpenIMRedEnvelopesRequest:(id)arg1 { %log; %orig; }
- (void)ReceiverQueryOpenIMRedEnvelopesRequest:(id)arg1 { %log; %orig; }
- (void)ReceiverQueryRedEnvelopesRequest:(id)arg1 { %log; %orig; }
- (void)SendShareRedEnvelopesoRequest:(id)arg1 { %log; %orig; }
- (void)GenYearRedEnvelopesPayRequest:(id)arg1 { %log; %orig; }
- (void)GenH5RedEnvelopesPayRequest:(id)arg1 { %log; %orig; }
- (void)QueryLiveStreamRedEnvelopesDetailRequest:(id)arg1 { %log; %orig; }
- (void)OpenLiveStreamRedEnvelopesRequest:(id)arg1 { %log; %orig; }
- (void)ReceiverQueryLiveStreamRedEnvelopesRequest:(id)arg1 { %log; %orig; }
- (void)GenLiveStreamRedEnvelopesPayRequest:(id)arg1 { %log; %orig; }
- (void)GenRedEnvelopesPayRequest:(id)arg1 { %log; %orig; }
- (void)GenOpenIMRedEnvelopesPayRequest:(id)arg1 { %log; %orig; }
- (void)QueryOpenIMRedEnvelopesUserInfoNoCache:(id)arg1 { %log; %orig; }
- (void)QueryOpenIMRedEnvelopesUserInfo:(id)arg1 { %log; %orig; }
- (void)QueryLiveStreamRedEnvelopesUserInfoNoCache:(id)arg1 { %log; %orig; }
- (void)QueryRedEnvelopesUserInfoNoCache:(id)arg1 { %log; %orig; }
- (void)QueryLiveStreamRedEnvelopesUserInfo:(id)arg1 { %log; %orig; }
- (void)QueryRedEnvelopesUserInfo:(id)arg1 { %log; %orig; }
- (void)GetEnterpriseHongbaoBizRequest:(id)arg1 CMDID:(unsigned int)arg2 SendKey:(id)arg3 OutputType:(unsigned int)arg4 { %log; %orig; }
- (void)GetEnterpriseHongbaoBusinessRequest:(id)arg1 CMDID:(unsigned int)arg2 SendKey:(id)arg3 OutputType:(unsigned int)arg4 ShouldSubscribe:(_Bool)arg5 { %log; %orig; }
- (void)GetYearHongbaoRequest:(id)arg1 CMDID:(unsigned int)arg2 OutputType:(unsigned int)arg3 { %log; %orig; }
- (void)GetHongbaoBusinessRequest:(id)arg1 CMDID:(unsigned int)arg2 OutputType:(unsigned int)arg3 { %log; %orig; }
- (void)GetOpenIMHongbaoBusinessRequest:(id)arg1 CMDID:(unsigned int)arg2 OutputType:(unsigned int)arg3 { %log; %orig; }
- (void)OnWCToAsyncBizSubscribeResponse:(id)arg1 Request:(id)arg2 { %log; %orig; }
- (void)OnWCToBizHBCommonResponse:(id)arg1 Request:(id)arg2 { %log; %orig; }
- (void)OnWCToBizHBCommonSystemErrorResponse:(id)arg1 Request:(id)arg2 { %log; %orig; }
- (void)OnWCToBizHBCommonErrorResponse:(id)arg1 Request:(id)arg2 { %log; %orig; }
- (void)OnWCToEnterpriseHBCommonResponse:(id)arg1 Request:(id)arg2 { %log; %orig; }
- (void)OnWCToEnterpriseHBCommonSystemErrorResponse:(id)arg1 Request:(id)arg2 { %log; %orig; }
- (void)OnWCToEnterpriseHBCommonErrorResponse:(id)arg1 Request:(id)arg2 { %log; %orig; }
- (void)addReceiveSystemMsgWithDic:(id)arg1 { %log; %orig; }
- (void)addOpenIMReceiveSystemMsgWithDic:(id)arg1 { %log; %orig; }
- (void)predownloadHbShowResource:(id)arg1 { %log; %orig; }
- (void)OnWCToHongbaoCommonResponse:(id)arg1 Request:(id)arg2 { %log; %orig; }
- (void)OnWCToLiveStreamHongbaoCommonResponse:(id)arg1 Request:(id)arg2 { %log; %orig; }
- (void)OnWCToOpenIMHongbaoCommonResponse:(id)arg1 Request:(id)arg2 { %log; %orig; }
- (void)OnWCToHongbaoCommonErrorResponse:(id)arg1 Request:(id)arg2 { %log; %orig; }
- (void)OnWCToHongbaoCommonSystemErrorResponse:(id)arg1 Request:(id)arg2 { %log; %orig; }
- (id)init { %log; id r = %orig; NSLog(@" = %@", r); return r; }
- (NSString *)debugDescription { %log; NSString * r = %orig; NSLog(@" = %@", r); return r; }
- (NSString *)description { %log; NSString * r = %orig; NSLog(@" = %@", r); return r; }
- (unsigned long long )hash { %log; unsigned long long  r = %orig; NSLog(@" = %llu", r); return r; }
- (Class )superclass { %log; Class  r = %orig; NSLog(@" = %@", r); return r; }
%end
*/
