class GenreController < Sinatra::Base

  # Sets routes of the partents directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # Sets the view directory correctly
  set :view, Proc.new { File.join(root, "views") }

  # Enable Reloader
  configure :development do
    register Sinatra::Reloader
  end

  $genres = [
    {
      id: 0,
      genre: "Grand Strategy",
    },
    {
      id: 1,
      genre: "Real Time Strategy",
    },
    {
      id: 2,
      genre: "First Person Shooter",
    },
    {
      id: 3,
      genre: "Massive Multiplayer Online Role Playing Game",
    },
    {
      id: 4,
      genre: "Action Roleplaying Game",
    },
    {
      id: 5,
      genre: "Platformer",
    }
  ]

  get '/genres' do

    @title = "Genre Index Page"
    @genre = $genres

    erb :'genres/index'
  end

  get '/genres/new' do

    "NEW"
    @genre = {
      id: '',
      title: '',
    }

    erb :'genres/new'
  end

  get '/genres/:id' do

    id = params[:id].to_i

    @title = "Genres Show Page"
    @genre = $genres[id]

    erb :'genres/show'
  end

  post '/genres' do

    # get the ID and turn it in to an integer
    id = params[:id].to_i

    # make a single post object available in the template
    @genre = $genres[id]

    erb :'genres/index'
  end

  put '/genres/:id' do

    id = params[:id].to_i

    genre = $genres[id]
    genre[:title] = params[:title]

    $genres[id] = genre

    redirect '/'

    erb :'genres/index'
  end

  delete '/genres/:id' do

    id = params[:id].to_i

    $genres.delete_at(id)

    redirect '/'

    erb :'genres/index'
  end

  get 'genres/:id/edit' do

    id = params[:id].to_i

    @genre = $genres[id]

    erb :'genres/edit'
  end

end
