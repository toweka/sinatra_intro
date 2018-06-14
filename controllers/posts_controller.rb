class PostsController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # Creates a global variable
  $posts = [
    {
      id: 0,
      title: "Post 1",
      body: "This is my first post, isnt it great"
    },
    {
      id: 1,
      title: "Post 2",
      body: "This is post 2"
    },
    {
      id: 2,
      title: "Post 3",
      body: "This is post 3"
    }
  ]

  #Global variable
  # $posts[1].title

  get '/' do
    "<a href='/clubs'>Clubs Index</a>
    <a href='/posts'>Posts Index</a>
    <a href='/stars'>Stars Index</a>
    <br>
    <h1>Main Index Page</h1>"

    @posts = Post.all

  end

  # get this information and display it to the screen
  # '/' means were on the homepage
  # Index page
  get '/posts' do
    @title = "Blog Posts"
    @posts = Post.all
    erb :'posts/index'
  end

  # New page
  get '/posts/new' do
    @post = {
      id: "",
      title: "",
      body: ""
    }
    erb :"posts/new"
  end

  # Create page
  post "/posts/" do
    post = Post.new

    post.title = params[:title]
    post.body = params[:body]

    post.save

    redirect '/posts'

  end

  # This creates a new page that is linked to the homepage
  # Show page
  get '/posts/:id' do

    #params returns a string
    id = params[:id].to_i

    @post = Post.find(id)

    erb :"posts/show"

  end

  # Edit page
  get "/posts/:id/edit" do
    id = params[:id].to_i

    @post = $posts[id]

    #redirects to edit.erb file
    erb :"posts/edit"
  end

  # Update page
  put "/posts/:id" do
    id = params[:id].to_i

    post = $posts[id]

    post[:title] = params[:title]
    post[:body] = params[:body]

    $posts[id] = post

    redirect "/posts/:id"
  end

  # Destroy page
  delete "/posts/:id" do
    id = params[:id].to_i

    $posts.delete_at(id)

    redirect "/posts"
  end

end
