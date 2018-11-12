require 'sinatra'

get '/' do
  erb :name
end

post '/name' do
  first_name = params[:fname]
  redirect '/last_name?fname=' + first_name
end

get '/last_name' do
  first_name = params[:fname]
  erb :last_name, locals: {first_name: first_name}
end

post '/last_name' do
  first_name = params[:fname]
  last_name = params[:lname]
  redirect '/age?fname=' + first_name + '&lname=' + last_name
end

get '/age' do
  last_name = params[:lname]
  first_name = params[:fname]
  erb :age, locals: {last_name: last_name, first_name: first_name}
end

post '/age' do
  age = params[:age]
  last_name = params[:lname]
  first_name = params[:fname]
  redirect '/fav_color?fname=' + first_name + '&lname=' + last_name + '&age=' + age
end

get '/fav_color' do
  age = params[:age]
  last_name = params[:lname]
  first_name = params[:fname]
  erb :fav_color, locals: {last_name: last_name, first_name: first_name, age: age}
end
