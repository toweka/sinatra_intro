class ClubsController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  get '/clubs' do
    "<h1>Clubs Index</h1> <p>Welcome to the rare and wonderful website that links football cubs with completely unrelated blog posts!"
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

    id = params[:id]

    "<h3>This is the #{id} page</h3>"
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
