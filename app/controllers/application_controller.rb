class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    :recipes
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :recipe
  end
  get '/recipes' do
    @all = Recipe.all
    erb :recipes
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to  "/recipes/#{@recipe.id}"
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to  "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
  end
end
