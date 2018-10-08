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