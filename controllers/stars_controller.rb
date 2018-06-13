class StarsController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  $stars = [
    {
      id: 0,
      title: "Stars 1",
      body: "This is the first star"
    },
    {
      id: 1,
      title: "Stars 2",
      body: "This is stars 2"
    },
    {
      id: 2,
      title: "Stars 3",
      body: "This is post 3"
    }
  ]

  get '/stars' do
    @title = "Stars"
    @stars = $stars
    erb :'stars/index'
  end

  # New page
  get '/stars/new' do
    "This is the new page of stars!!!"
  end

  # Create page
  post "/stars/:id" do

  end

  # This creates a new page that is linked to the homepage
  # Show page
  get '/stars/:id' do

    id = params[:id].to_i

    @star = $stars[id]
    @title = @star[:title]

    erb :"stars/show"
  end

  # Edit page
  get "/stars/:id/edit" do
    "Edit page"
  end

  # Update page
  put "/stars/:id" do
    "Update page"
  end

  # Destroy page
  delete "/stars/:id" do
    "Update page"
  end

end
