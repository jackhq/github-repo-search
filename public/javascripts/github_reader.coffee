Ext.data.GithubReader: Ext.extend Ext.data.JsonReader, {
  root: 'repositories'
}

Ext.data.ReaderMgr.registerType 'github', Ext.data.GithubReader