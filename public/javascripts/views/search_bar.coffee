
# @class twitter.SearchBar
# @extends Ext.DataView
# Displays a search field and list of saved searches

github.SearchBar: Ext.extend Ext.DataView, {
    cls: 'x-nested-list twitter-search-bar'
    width: 200
    dock : 'left'
    
    tpl: [
        '<tpl for=".">',
            '<div class="x-button x-button-normal">',
                '<span>{query}</span>',
            '</div>',
        '</tpl>'
    ].join('')
    
    itemSelector: 'div.x-button'
    singleSelect: true
    
    constructor: (config) ->
      @addEvents('refresh', 'search')
      config = config || {};
      
      @searchField: new Ext.form.SearchField {
        name: 'query'
        placeholder: "Search"
        style: 'width: 188px'
      }
       
      @refreshButton: new Ext.Button {
          ui: 'mask'
          iconCls: 'refresh'
          scope  : this
          handler: ->
            records: this.getSelectedRecords()
            search: records[0]

            if search
              @fireEvent 'search', search.get('query')
          
      }

      @resetButton: new Ext.Button {
        ui: 'mask'
        iconCls: 'trash'
        scope: this
        handler: @reset
      }

      @searchForm: new Ext.form.FormPanel {
        baseCls: 'x-form-nostyle'
        items: this.searchField

        listeners: {
            scope: this,
            submit: this.onFormSubmit
        }
      }

      Ext.applyIf config, {
        store: new Ext.data.Store({
          model: 'Search',
          proxy: new Ext.data.LocalStorageProxy({
            id: 'github-searches'
          }),
          autoLoad: {
            scope: @,
            callback: @addDefaultSearches
          }
        }),
        dockedItems: [{
          dock : 'top',
          xtype: 'toolbar',
          items: @searchForm
          },
          {
            dock: 'bottom',
            xtype: 'toolbar',
            items: [
              @refreshButton,
              @resetButton,
              {xtype: 'spacer'},
              {
                text: 'About',
                xtype: 'button',
                handler: ->
                  new github.About({}).show()
              }
            ]
          }
        ]
      }

      github.SearchBar.superclass.constructor.call this, config

      @on 'selectionchange', (me, nodes) ->
        records: me.getSelectedRecords()
        search: records[0]

        if search                
          me.fireEvent('search', search.get('query'))


  reset: ->
    for r in @store.data.items    
      @store.remove(0)        

    @store.destroy {
        scope: this,
        callback: this.addDefaultSearches
    }

  addDefaultSearches: ->
    if @store.data.items.length is 0 
      x: ->
        @store.add {query: "Ext JS"}
        @store.add {query: "Sencha Touch"}
        @store.sync()
        @fireEvent 'search', "Ext JS"

        @selectFirst()
        
      x.defer(100, this)
    else
      @selectFirst()


  selectFirst: ->
    record: @store.data.first()

    if record
      @select(record)


  onFormSubmit: (form, values) ->
    field: @searchField
    value: field.getValue()

    record: @store.add({query: value})[0]
    @store.sync()
    Ext.getBody().dom.focus()

    @select(@store.data.last())

}

Ext.reg 'searchbar', github.SearchBar