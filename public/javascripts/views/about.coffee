# @class twitter.About
# @extends Ext.Panel
# Simple floating panel containing some about text

github.About: Ext.extend Ext.Panel, {
    width: 500
    height: 400
    floating: true
    centered: true
    modal: true
    scroll: 'vertical',
    styleHtmlContent: true
    dockedItems: [{
        dock: 'top'
        xtype: 'toolbar'
        title: 'About The Github Search App'
        items: [{
            text: 'Close',
            handler: ->
              @ownerCt.ownerCt.hide()
        }]
    }]
    items: [{
        style: 'padding: 10px;'
        html: """
          <p>The Github app is a simple demonstration of the Ext.data package.</p>'
          <p>The left menu bar features a very simple DataView (see views/search_bar.js) which uses'
          a Store with a LocalStorageProxy to save recent searches locally. These then return when you refresh the page</p>'
          <p>The central pane is also a DataView, this time using a Store which is bound to a ScriptTagProxy - see src/github_proxy.js.</p>'
          <p>Finally, two simple Models are defined (see models/Repo.js and models/search.js). These are used by the timeLine and'
          the search_bar respectively for saving and retrieving GitHub Repos and saved Searches.</p>
      """
    }]
}