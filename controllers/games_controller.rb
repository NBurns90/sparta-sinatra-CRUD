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
      description: "In Civilization V, the player leads a civilization from prehistoric times into the future on a procedurally generated map, attempting to achieve one of a number of different victory conditions through research, exploration, diplomacy, expansion, economic development, government and military conquest.",
      genreid: 0
    },
    {
      id: 1,
      title: "World of Warcraft",
      description: "World of Warcraft (WoW) is a massively multiplayer online role-playing game (MMORPG) released in 2004 by Blizzard Entertainment. It is the fourth released game set in the Warcraft fantasy universe. World of Warcraft takes place within the Warcraft world of Azeroth, approximately four years after the events at the conclusion of Blizzard's previous Warcraft release, Warcraft III: The Frozen Throne.",
      genreid: 3
    },
    {
      id: 2,
      title: "Quake",
      description: "Quake is a first-person shooter video game, developed by id Software and published by GT Interactive in 1996. It is the first game in the Quake series. In the game, players must find their way through various maze-like, medieval environments while battling a variety of monsters using a wide array of weapons.",
      genreid: 2
    },
    {
      id: 3,
      title: "Earthworm Jim",
      description: "Earthworm Jim is a series of side-scrolling platforming video games,[1] the first game of which was released in 1994. The series is noted for its platforming and shooting gameplay, surrealist humor, and edgy art style Four games were released in the series: Earthworm Jim, Earthworm Jim 2, Earthworm Jim 3D, and Earthworm Jim: Menace 2 the Galaxy.",
      genreid: 5
    },
    {
      id: 4,
      title: "Starcraft",
      description: "StarCraft is a military science fiction media franchise, created by Chris Metzen and James Phinney and owned by Blizzard Entertainment. The series, set in the beginning of the 26th century, centers on a galactic struggle for dominance among four species—the adaptable and mobile Terrans, the ever-evolving insectoid Zerg, the powerfully enigmatic Protoss, and the god like Xel'Naga creator race—in a distant part of the Milky Way galaxy known as the Koprulu Sector. The series debuted with the video game StarCraft in 1998.",
      genreid: 1
    },
    {
      id: 5,
      title: "Stellaris",
      description: "Stellaris is a 4X grand strategy video game developed and published by Paradox Interactive. Stellaris's gameplay revolves around space exploration, managing an empire, and diplomacy and warfare with other spacefaring civilizations.",
      genreid: 0
    },
    {
      id: 6,
      title: "Deus Ex",
      description: "Deus Ex is a 2000 action role-playing video game developed by Ion Storm and published by Eidos Interactive. Set in a cyberpunk-themed dystopian world in the year 2052, the story follows JC Denton, an anti-terrorist agent given superhuman abilities by nanotechnology, as he sets out to combat hostile forces in a world ravaged by inequality and a deadly plague. His missions entangle him in a conspiracy that brings him into conflict with the Triad, Majestic 12, and the Illuminati.",
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

      new_game = {
        title: params[:title],
        body: params[:body],
        genreid: params[:genreid]
      }

      $games.push(new_game)

      redirect '/games'

      erb :'games/index'
    end

    # Update
    put '/games/:id' do

      id = params[:id].to_i

      game = $games[id]

      game[:title] = params[:title]
      game[:description] = params[:description]
      game[:genreid] = params[:genreid]

      $games[id] = game

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
