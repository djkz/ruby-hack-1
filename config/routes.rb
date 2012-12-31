RubyHack1::Application.routes.draw do
  get "welcome/index"
  match "guess/:id" => 'welcome#guess', as: "guess"

  root :to => 'welcome#index'

end
