class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/recipes"
  end

  #index

  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  #new

  get "/recipes/new" do
    @recipe = Recipe.new
    erb :new
  end

    # create
  post "/recipes" do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{ @recipe.id }"
  end

  # show
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  # edit
  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  # update
  patch "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect to "/recipes/#{ @recipe.id }"
  end

  #destroy
  delete "/recipes/:id" do
    Recipe.destroy(params[:id])
    redirect to "/recipes"
  end

end
