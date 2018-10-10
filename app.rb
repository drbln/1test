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

post '/guitare' do
	@name = params[:name]
	@fam = params[:fam]
	@num = params[:num]
	@date = params[:date]
	record = File.open 'records/guitare.txt', 'a'
		record.write "#{@name} #{@fam},#{@num},#{@date}\n"
		record.close
		erb :index
end