(function(){
  //Ext.data.GithubProxy: Ext.extend Ext.data.AjaxProxy, {
  //  url: '/search',
  Ext.data.GithubProxy = Ext.extend(Ext.data.ScriptTagProxy, {
    url: 'http://github.com/api/v2/json/repos/search/',
    reader: 'github',
    defaultQuery: 'coffeescript',
    cacheString: 'dc',
    noCache: false,
    constructor: function(config) {
      config = config || {};
      Ext.applyIf(config, {
        extraParams: {
          q: this.defaultQuery
        }
      });
      return Ext.data.GithubProxy.superclass.constructor.call(this, config);
    },
    buildUrl: function(request) {
      var url;
      url = Ext.data.ScriptTagProxy.superclass.buildUrl.call(this, request);
      return url + request.params.q;
    }
  });
  Ext.data.ProxyMgr.registerType('github', Ext.data.GithubProxy);
})();
