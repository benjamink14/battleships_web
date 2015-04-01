require 'sinatra/base'
require_relative 'game'
require_relative 'player'
require_relative 'board'
require_relative 'cell'
require_relative 'ship'
require_relative 'water'


class BattleShips < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views")}
  get '/' do
    'Hello BattleShips!'
    erb :index
  end

  get '/new_game' do
    "What's your name?"
    erb :game_start
  end

  get '/start' do
    'hello'
    @player = params[:name]
    @game =  Game.new(Player.new('player'), Player.new('robot'))
    @board = Board.new({size: 100, cell: Cell, number_of_pieces: 5})
    erb :start
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
