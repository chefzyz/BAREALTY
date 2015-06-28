require 'sinatra'

get '/index' do
	erb :index
end

get '/contact' do
	erb :contact
end

get '/find' do
	erb :find
end

get '/sell' do
	erb :sell
end

post '/contact' do
	require 'mandrill'  
m = Mandrill::API.new
message = {  
 :subject=> params[:subject],  
 :from_name=> params[:name], 
 :text=> params[:message] + "Your Phone number is " + params[:tel],  
 :to=>[  
   {  
     :email=> "elderazeez20@gmail.com",  
     :name=> "Elder Azeez"  
   }  
 ],  
 #:html=>"<html><h1>Hi <strong>message</strong>, how are you?</h1></html>",
 :from_email=> params[:email] 
}  
sending = m.messages.send message  
puts sending
erb :contact
end