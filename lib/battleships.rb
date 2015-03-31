require 'sinatra/base'

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
    end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
