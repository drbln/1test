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

get '/singup' do
  erb :singup
end

get '/vocal' do
	erb :vocal
end

post '/login' do
	@login = params[:login]
	@password =params[:password]
		if @login=="guitare" && @password=="guitare"
			erb :guitare_rec
		end
		
		if @login=="vocal" && @password=="vocal"
			erb :vocal_rec
		end
end

post '/singup' do
	@type = params[:type]
	@name = params[:name]
	@fam = params[:fam]
	@num = params[:num]
	@date = params[:date]
		if @type=="Гитара"
			record = File.open 'public/records/guitare.txt', 'a'
			record.write "#{@name} #{@fam},#{@num},#{@date}\n"
			record.close
			erb "Вы успешно записались на #{@type}, спасибо"
		end
		
		if @type=="Вокал"
			record = File.open 'public/records/vocal.txt', 'a'
			record.write "#{@name} #{@fam},#{@num},#{@date}\n"
			record.close
			erb "Вы успешно записались на #{@type}, спасибо"
		end
end
