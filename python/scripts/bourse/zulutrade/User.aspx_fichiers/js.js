Type.registerNamespace('ZuluTrade.WebServices');
ZuluTrade.WebServices.Tags=function() {
ZuluTrade.WebServices.Tags.initializeBase(this);
this._timeout = 0;
this._userContext = null;
this._succeeded = null;
this._failed = null;
}
ZuluTrade.WebServices.Tags.prototype={
_get_path:function() {
 var p = this.get_path();
 if (p) return p;
 else return ZuluTrade.WebServices.Tags._staticInstance.get_path();},
RemoveTag:function(tagObjectId,succeededCallback, failedCallback, userContext) {
return this._invoke(this._get_path(), 'RemoveTag',false,{tagObjectId:tagObjectId},succeededCallback,failedCallback,userContext); }}
ZuluTrade.WebServices.Tags.registerClass('ZuluTrade.WebServices.Tags',Sys.Net.WebServiceProxy);
ZuluTrade.WebServices.Tags._staticInstance = new ZuluTrade.WebServices.Tags();
ZuluTrade.WebServices.Tags.set_path = function(value) { ZuluTrade.WebServices.Tags._staticInstance.set_path(value); }
ZuluTrade.WebServices.Tags.get_path = function() { return ZuluTrade.WebServices.Tags._staticInstance.get_path(); }
ZuluTrade.WebServices.Tags.set_timeout = function(value) { ZuluTrade.WebServices.Tags._staticInstance.set_timeout(value); }
ZuluTrade.WebServices.Tags.get_timeout = function() { return ZuluTrade.WebServices.Tags._staticInstance.get_timeout(); }
ZuluTrade.WebServices.Tags.set_defaultUserContext = function(value) { ZuluTrade.WebServices.Tags._staticInstance.set_defaultUserContext(value); }
ZuluTrade.WebServices.Tags.get_defaultUserContext = function() { return ZuluTrade.WebServices.Tags._staticInstance.get_defaultUserContext(); }
ZuluTrade.WebServices.Tags.set_defaultSucceededCallback = function(value) { ZuluTrade.WebServices.Tags._staticInstance.set_defaultSucceededCallback(value); }
ZuluTrade.WebServices.Tags.get_defaultSucceededCallback = function() { return ZuluTrade.WebServices.Tags._staticInstance.get_defaultSucceededCallback(); }
ZuluTrade.WebServices.Tags.set_defaultFailedCallback = function(value) { ZuluTrade.WebServices.Tags._staticInstance.set_defaultFailedCallback(value); }
ZuluTrade.WebServices.Tags.get_defaultFailedCallback = function() { return ZuluTrade.WebServices.Tags._staticInstance.get_defaultFailedCallback(); }
ZuluTrade.WebServices.Tags.set_path("/WebServices/Tags.asmx");
ZuluTrade.WebServices.Tags.RemoveTag= function(tagObjectId,onSuccess,onFailed,userContext) {ZuluTrade.WebServices.Tags._staticInstance.RemoveTag(tagObjectId,onSuccess,onFailed,userContext); }
