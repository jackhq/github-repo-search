Ext.ns 'github'

Ext.setup {
  tabletStartupScreen: 'tablet_startup.png',
  phoneStartupScreen: 'phone_startup.png',
  icon: 'icon.png',
  glossOnIcon: false,
  onReady: ->
      searchbar: new github.SearchBar()
      repolist: new github.RepoList()

      viewport: new Ext.Panel({
          fullscreen : true,
          scroll     : 'vertical',
          dockedItems: [searchbar],
          items      : [repolist],
          cls        : 'github-main'
      })

      searchbar.on {
        search: (query) ->
          # Ext.Ajax.request {
          #     url: 'search?q=coffeescript',
          #     method: 'GET',
          #     success: (response, opts) ->
          #       console.info response.responseText
          # }
          # 
          if query
            repolist.store.read {
              params: { 
                q: query.split(' ').join('+')
              }
            }
          
            viewport.scroller.scrollTo {x: 0, y: 0}
      }
  
}