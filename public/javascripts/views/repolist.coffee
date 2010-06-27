# @class twitter.TimeLine
# @extends Ext.DataView
# Simple Twitter timeline component

github.RepoList: Ext.extend Ext.DataView, {
  cls: 'repolist'
  scroll: false

  tpl: [
  '<tpl for=".">',
      '<div class="repo">',
      '<div class="repo-bubble">',
          '<div class="repo-content">',
              '<span>Language: {language}</span>',
              '<a href="http://github.com/{username}/{name}"><h2>{name} by {username}</h2></a>',
              '<p>{description}</p><strong></strong>',
              
          '</div>',
      '</div>',
      '</div>',
  '</tpl>'
  ].join('')

  itemSelector: 'div.repo',
  emptyText: '<p style="padding: 10px">No repos found matching that search</p>',

  initComponent: ->
    @store: new Ext.data.Store({
      proxy: new Ext.data.GithubProxy()
      autoLoad: false
      model: "Repo"
    })

    github.RepoList.superclass.initComponent.apply(this, arguments);
}

Ext.reg 'repolist', github.RepoList