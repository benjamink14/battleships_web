require 'sinatra/base'
require_relative 'game'
require_relative 'player'
require_relative 'board'
require_relative 'cell'
require_relative 'ship'
require_relative 'water'
require 'byebug'

class BattleShips < Sinatra::Base
  set :public, Proc.new { File.join(root,"..", "public")}

  enable :sessions

  GAME = nil

  set :views, Proc.new { File.join(root,"..", "views")}
  get '/' do
    erb :index
  end

  get '/new_game' do
    'What s your name?'
    erb :game_start
  end

  get '/start' do
    @player = params[:name]
    GAME = Game.new(Player.new(@player, Ship), Player.new("Player2", Ship))
    @board = session[:board] || Board.new({size: 100, cell: Cell, number_of_pieces: 5})
    # If you close window, you can't come back to game
    session[:player] = @player
    session[:board] = @board
    erb :start
  end

   get '/hit' do
    @coordinate_to_hit = params[:coordinate_to_hit]
    @board = session[:board]
    @board.hit_coordinate(@coordinate_to_hit) if @coordinate_to_hit
    erb :start
  end

  get '/place_ship' do
    @board = session[:board]
    @ship_length = params[:length].to_i
    @ship_direction = params[:direction].to_sym
    @cell_for_ship = params[:cell].upcase.to_sym
    @ship = Ship.new({size: @ship_length})
    @board.place @ship, @cell_for_ship, @ship_direction
    @player = GAME.players[session[:player]]
    @player.ships.each do |ship|
      @player.ships.delete(ship) if ship.size == @ship_length 
    end
    erb :start
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
