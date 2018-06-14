require "sinatra"
require "sinatra/contrib"
require "sinatra/reloader" if development?
require "pg"
require_relative "../sinatra_intro/controllers/posts_controller.rb"
require_relative "../sinatra_intro/controllers/clubs_controller.rb"
require_relative "../sinatra_intro/controllers/stars_controller.rb"
require_relative "../sinatra_intro/models/post.rb"

use Rack::MethodOverride
run PostsController
use ClubsController
use StarsController
