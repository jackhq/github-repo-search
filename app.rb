require 'sinatra'
require 'open-uri'

get '/' do
  redirect 'index.html'
end

get '/search' do
  #mime :json, "application/json"
  content_type "application/x-json"
  #%Q{{"repositories":[{"name":"lipsiadmin","size":5017,"followers":140,"language":"JavaScript","username":"DAddYE","fork":false,"id":"repo-8754","type":"repo","pushed":"2010-02-03T17:45:34Z","forks":11,"description":"Lipsiadmin is a new revolutionary admin for your projects. Lipsiadmin is based on Ext Js 3+. framework (with prototype adapter) and is ready for Rails 2.+. \n\nThis admin is for newbie developper but also for experts, is not entirely written in javascript because the aim of developper wose build in a agile way web/site apps so we use extjs in a new intelligent way a mixin of “old” html and new ajax functions, for example ext manage the layout of page, grids, tree and errors, but form are in html code.","score":0.34838662,"created":"2008-04-11T14:50:52Z"}]}}
  if params[:q]
    open("http://github.com/api/v2/json/repos/search/#{params[:q]}").read
  else
    {:repositories => []}.to_json
  end
end


get '/application.manifest' do
  content_type "text/cache-manifest"
  %Q{
CACHE MANIFEST
#rev3

stylesheets/ext-touch.css
stylesheets/github.css
javascripts/ext-touch.js
javascripts/github_proxy.js
javascripts/github_reader.js
javascripts/models/search.js
javascripts/models/repo.js
javascripts/views/about.js
javascripts/views/search_bar.js
javascripts/views/readme.js
javascripts/index.js
icon.png
phone_startup.png
tablet_startup.png

NETWORK:
/
  }
end
