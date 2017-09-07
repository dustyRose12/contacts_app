Rails.application.routes.draw do
  
  get '/' => 'contacts#index' #this makes a shortcut so you dont have to type recipes every time on the url.
  get '/contacts' => 'contacts#index' #URL is recipes, action is index

  get '/contacts/new' =>  'contacts#new' #always put new before :id, otherwise it thinks you're trying to pass new as an id
  post '/contacts' =>  'contacts#create'

  get '/contacts/:id' => 'contacts#show' #URL is recipes with ID, action is show to show a specific one

  get '/contacts/:id/edit' => 'contacts#edit'
  patch '/contacts/:id' => 'contacts#update'

  delete '/contacts/:id' => 'contacts#destroy'
end
