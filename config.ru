require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './controllers/games_controller.rb'
require_relative './controllers/genre_controller.rb'
require_relative './controllers/static_controller.rb'



run Rack::Cascade.new([
  StaticController,
  GamesController,
  GenreController
])

use Rack::MethodOverride
