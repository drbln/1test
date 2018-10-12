#encoding: utf-8
#encoding: cp866
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb :index			
end

get '/about' do
	erb :about
end

get '/classes' do
	erb :classes
end

get '/contacts' do
	erb :contacts
end

get '/guitare' do
	erb :guitare
end

get '/guitare_rec' do
	erb :guitare_rec
end

get '/login' do
	erb :login
end

post '/login' do
	@login = params[:login]
	@password =params[:password]
		if @login=="guitare" && @password=="guitare"
			erb :guitare_rec
		else erb :login
		end
end

post '/guitare' do
	@name = params[:name]
	@fam = params[:fam]
	@num = params[:num]
	@date = params[:date]
	record = File.open 'public/records/guitare.txt', 'a'
		record.write "#{@name} #{@fam},#{@num},#{@date}\n"
		record.close
		erb :index
end
