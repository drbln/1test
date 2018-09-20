require 'sinatra'

get '/' do
	erb :index
end

get '/reg' do
	erb :reg
end

post '/' do
	@user_name = params[:user_name]
	@password = params[:password]
	File.open 'logpass.txt', 'r' do |file|
		if file.read().include? "#{@user_name},#{@password}"
			erb :welcome
			else @massage = "Incorrect login or password" 
				erb :index
		end
	end
end

post '/reg' do
	@user_name = params[:user_name]
	@password = params[:password]
		File.open 'logpass.txt', 'r+' do |file|
			if file.read().include? "#{@user_name}"
				@massage2 = "Login is busy"
				erb :reg
				else logpass = File.open 'logpass.txt', 'a'
					 logpass.write "#{@user_name},#{@password}\n"
					 logpass.close
					 erb :index
			end
		end
	#logpass = File.open 'logpass.txt', 'a'
	#logpass.write "#{@user_name},#{@password}\n"
	#logpass.close
	#erb :index
end