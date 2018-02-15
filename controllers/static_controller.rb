class StaticController < Sinatra::Base

  # Sets routes of the partents directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # Sets the view directory correctly
  set :view, Proc.new { File.join(root, "views") }

  # Enable Reloader
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @title = 'Welcome'

    erb :'static/static'
  end

end
