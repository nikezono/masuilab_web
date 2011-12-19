# -*- coding: utf-8 -*-
get '/' do
  @title = @@conf['title']
  haml :entrance
end

get '/:wiki/title' do
  wiki = params[:wiki]
  @title = getTitleFromGyazz(wiki)
end

get '/:wiki/menu.json' do
  #wiki = URI.encode(params[:wiki])
  @menu = getMenuFromGyazz(params[:wiki]).to_json
end


get '/:wiki/:content.json' do
  #wiki = URI.encode(params[:wiki])
  #content = URI.encode(params[:content])
  @content = getContentFromGyazz(params[:wiki],params[:content]).to_json
end

get '/:wiki' do
  @wiki = params[:wiki]
  @title        = getTitleFromGyazz(@wiki)
  @menuArray    = getMenuFromGyazz(@wiki)
  haml :index
end


