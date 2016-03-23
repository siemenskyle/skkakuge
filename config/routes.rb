Saskkakuge::Application.routes.draw do

  get "tournament/:id" => "tournament#view"

  get "player/all"
  get "player/:id" => "player#view"

  get "games/:name" => "games#view"



  get "admin/login" => "login#login"
  post "admin/trylogin" => "login#trylogin"
  get "admin/logout" => "login#logout"

  get "admin" => "admin#menu"

  get "admin/addplayer" => "player#add"
  post "admin/createplayer" => "player#create"
  get "admin/removeplayer" => "player#remove"

  get "admin/addplayertogame" => "playerpoints#add"
  post "admin/createpp" => "playerpoints#create"

  get "admin/addtourney" => "tournament#add"
  post "admin/createtourney" => "tournament#create"
  post "admin/createresults/:tid" => "tournament#createresults"
  get "admin/deletetourney/:tid" => "tournament#delete"

  get "admin/calculatepoints" => "playerpoints#calculateall"

  get "admin/addgame" => "games#add"
  get "admin/creategame" => "games#create"



  root 'welcome#home'
end