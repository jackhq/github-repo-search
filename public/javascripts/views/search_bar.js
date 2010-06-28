// @class twitter.SearchBar
// @extends Ext.DataView
// Displays a search field and list of saved searches
github.SearchBar = Ext.extend(Ext.DataView, {
  cls: 'x-nested-list twitter-search-bar',
  width: 200,
  dock: 'left',
  tpl: ['<tpl for=".">', '<div class="x-button x-button-normal">', '<span>{query}</span>', '</div>', '</tpl>'].join(''),
  itemSelector: 'div.x-button',
  singleSelect: true,
  constructor: function(config) {
    this.addEvents('refresh', 'search');
    config = config || {};
    this.searchField = new Ext.form.SearchField({
      name: 'query',
      placeholder: "Search",
      style: 'width: 188px'
    });
    this.refreshButton = new Ext.Button({
      ui: 'mask',
      iconCls: 'refresh',
      scope: this,
      handler: function() {
        var records, search;
        records = this.getSelectedRecords();
        search = records[0];
        if (search) {
          return this.fireEvent('search', search.get('query'));
        }
      }
    });
    this.resetButton = new Ext.Button({
      ui: 'mask',
      iconCls: 'trash',
      scope: this,
      handler: this.reset
    });
    this.searchForm = new Ext.form.FormPanel({
      baseCls: 'x-form-nostyle',
      items: this.searchField,
      listeners: {
        scope: this,
        submit: this.onFormSubmit
      }
    });
    Ext.applyIf(config, {
      store: new Ext.data.Store({
        model: 'Search',
        proxy: new Ext.data.LocalStorageProxy({
          id: 'github-searches'
        }),
        autoLoad: {
          scope: this,
          callback: this.addDefaultSearches
        }
      }),
      dockedItems: [
        {
          dock: 'top',
          xtype: 'toolbar',
          items: this.searchForm
        }, {
          dock: 'bottom',
          xtype: 'toolbar',
          items: [
            this.refreshButton, this.resetButton, {
              xtype: 'spacer'
            }, {
              text: 'About',
              xtype: 'button',
              handler: function() {
                return new github.About({}).show();
              }
            }
          ]
        }
      ]
    });
    github.SearchBar.superclass.constructor.call(this, config);
    return this.on('selectionchange', function(me, nodes) {
      var records, search;
      records = me.getSelectedRecords();
      search = records[0];
      if (search) {
        return me.fireEvent('search', search.get('query'));
      }
    });
  },
  reset: function() {
    var _a, _b, _c, r;
    _b = this.store.data.items;
    for (_a = 0, _c = _b.length; _a < _c; _a++) {
      r = _b[_a];
      this.store.remove(0);
    }
    return this.store.destroy({
      scope: this,
      callback: this.addDefaultSearches
    });
  },
  addDefaultSearches: function() {
    var x;
    if (this.store.data.items.length === 0) {
      x = function() {
        this.store.add({
          query: "Ext JS"
        });
        this.store.add({
          query: "Sencha Touch"
        });
        this.store.sync();
        this.fireEvent('search', "Ext JS");
        return this.selectFirst();
      };
      return x.defer(100, this);
    } else {
      return this.selectFirst();
    }
  },
  selectFirst: function() {
    var record;
    record = this.store.data.first();
    if (record) {
      return this.select(record);
    }
  },
  onFormSubmit: function(form, values) {
    var field, record, value;
    field = this.searchField;
    value = field.getValue();
    record = this.store.add({
      query: value
    })[0];
    this.store.sync();
    Ext.getBody().dom.focus();
    return this.select(this.store.data.last());
  }
});
Ext.reg('searchbar', github.SearchBar);