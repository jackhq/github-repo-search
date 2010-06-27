(function(){
  // @class twitter.About
  // @extends Ext.Panel
  // Simple floating panel containing some about text
  github.About = Ext.extend(Ext.Panel, {
    width: 500,
    height: 400,
    floating: true,
    centered: true,
    modal: true,
    scroll: 'vertical',
    styleHtmlContent: true,
    dockedItems: [
      {
        dock: 'top',
        xtype: 'toolbar',
        title: 'About The Github Search App',
        items: [
          {
            text: 'Close',
            handler: function() {
              return this.ownerCt.ownerCt.hide();
            }
          }
        ]
      }
    ],
    items: [
      {
        style: 'padding: 10px;',
        html: "          <h1>Github Repository Search Application</h1>\n          <p>This is a sample application that performs a repo search for github repositories.  It is using Sencha Touch Technologies and the Github repo api to find repos about certain technologies.</p>\n          <h1>Why</h2>\n          <h2>We love reading source code, and a great device to read it on is the iPad, it would be nice to have an HTML 5 application that works on the ipad to search and browse the github repositories to easily locate repositories of interest.</h2>\n"
      }
    ]
  });
})();
