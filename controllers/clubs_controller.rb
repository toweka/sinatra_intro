class ClubsController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  $clubs = [
    {
      id: 0,
      title: "Clubs 1",
      body: "This is the first club"
    },
    {
      id: 1,
      title: "Clubs 2",
      body: "This is clubs 2"
    },
    {
      id: 2,
      title: "Clubs 3",
      body: "This is post 3"
    }
  ]

  get '/clubs' do
    @title = "Clubs"
    @clubs = $clubs
    erb :'clubs/index'
  end

  # New page
  get '/clubs/new' do
    "This is the new page for top clubs!!!"
  end

  # Create page
  post "/clubs/:id" do

  end

  # This creates a new page that is linked to the homepage
  # Show page
  get '/clubs/:id' do

    id = params[:id].to_i

    @club = $clubs[id]
    @title = @club[:title]

    erb :"clubs/show"
  end

  # Edit page
  get "/clubs/:id/edit" do
    "Edit page"
  end

  # Update page
  put "/clubs/:id" do
    "Update page"
  end

  # Destroy page
  delete "/clubs/:id" do
    "Update page"
  end

end
