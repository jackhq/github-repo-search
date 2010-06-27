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
        html: "<h1>Github Repository Search Application</h1>\n<p>This is a sample application that performs a \nrepo search for github repositories.  It is using \nSencha Touch Technologies and the Github repo api \nto find repos about certain technologies.</p>\n<h2>Why</h2>\n<p>We love reading source code, and the iPad is a great device \nto read.  We thought it would be nice to have \nan HTML 5 application that works on the ipad to search \nand browse the github repositories to easily locate \nrepositories of interest.</p>\n<h2>\n<img src=\"http://jackhq.s3.amazonaws.com/images/jackhq.png\" />\n<p>Jack Russell Software Company, LLC</p>\n<a href=\"http://jackhq.com\">www.jackhq.com</a>"
      }
    ]
  });
})();
