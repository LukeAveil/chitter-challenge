require 'sinatra/base'
require_relative 'models/peep'


class Chitter < Sinatra::Base
  get '/' do
  	"Hello!"
  end

  get '/peeps' do
  	@peeps = Peep.all
  	erb :'peeps/index'
  end

  get '/peeps/new' do
  	erb :'peeps/new'
  end

  post '/peeps' do
  	Peep.create(peep: params[:peep])
  	redirect '/peeps'
  end

  run! if app_file == $0
end