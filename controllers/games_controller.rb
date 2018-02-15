class GamesController < Sinatra::Base

  # Sets routes of the partents directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # Sets the view directory correctly
  set :view, Proc.new { File.join(root, "views") }

  # Enable Reloader
  configure :development do
    register Sinatra::Reloader
  end

  $games = [
    {
      id: 0,
      title: "Civilisation 5",
      description: "",
      genreid: 0
    },
    {
      id: 1,
      title: "World of Warcraft",
      description: "",
      genreid: 3
    },
    {
      id: 2,
      title: "Quake",
      description: "",
      genreid: 2
    },
    {
      id: 3,
      title: "Earthworm Jim",
      description: "",
      genreid: 5
    },
    {
      id: 4,
      title: "Starcraft",
      description: "",
      genreid: 1
    },
    {
      id: 5,
      title: "Stellaris",
      description: "",
      genreid: 0
    },
    {
      id: 6,
      title: "Deus Ex",
      description: "",
      genreid: 4
    }
  ]

    # Game Index Page
    get '/games' do

      @title = "Games Index Page"
      @game = $games

      erb :'games/index'
    end

    # New Game Page
    get '/games/new' do

      @title = "New Game Page"

      "NEW"
      @game = {
        id: '',
        title: '',
        body: ''
      }

      erb :'games/new'
    end

    # Game Show Page
    get '/games/:id' do

      id = params[:id].to_i

      @title = "Game Show Page"
      @game = $games[id]


      erb :'games/show'
    end

    # Create
    post '/games' do

      # get the ID and turn it in to an integer
      id = params[:id].to_i

      # make a single post object available in the template
      @game = $games[id]

      erb :'games/index'
    end

    # Update
    put '/games/:id' do

      id = params[:id].to_i

      game = $games[id]

      game[:title] = params[:title]
      game[:description] = params[:description]
      game[:genreid] = param[:genreid]

      $games[id] = post

      redirect '/games'

      erb :'games/index'
    end

    # Delete
    delete '/games/:id' do

      id = params[:id].to_i

      $games.delete_at(id)

      redirect '/games'

      erb :'games/index'
    end

    # Edit Page
    get '/games/:id/edit' do

      id = params[:id].to_i

      @game = $games[id]

      erb :'games/edit'
    end


end
