#Ext.data.GithubProxy: Ext.extend Ext.data.AjaxProxy, {
#  url: '/search',
Ext.data.GithubProxy: Ext.extend Ext.data.ScriptTagProxy, {
  url: 'http://github.com/api/v2/json/repos/search/',

  reader: 'github',
  defaultQuery: 'coffeescript',
  cacheString: 'dc',
  noCache: false,
  
  constructor: (config) ->
    config = config or {}
    Ext.applyIf config, {
      extraParams: {
        q: @defaultQuery
      }
    }
    
    Ext.data.GithubProxy.superclass.constructor.call(this, config) 
  
  buildUrl: (request) ->
      url: Ext.data.ScriptTagProxy.superclass.buildUrl.call(this, request)
      url + request.params.q

   
}

Ext.data.ProxyMgr.registerType 'github', Ext.data.GithubProxy