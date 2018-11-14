require 'sinatra'
require_relative 'addition.rb'
require_relative 'multiplication.rb'
require_relative 'subtraction.rb'
require_relative 'division.rb'

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

post '/fav_color' do
  fav_color = params[:fav_color]
  age = params[:age]
  last_name = params[:lname]
  first_name = params[:fname]
  redirect '/lucky_number_one?fname=' + first_name + '&lname=' + last_name + '&age=' + age + '&fav_color=' + fav_color
end


get '/lucky_number_one' do
  fav_color = params[:fav_color]
  age = params[:age]
  last_name = params[:lname]
  first_name = params[:fname]
  erb :lucky_number_one, locals: {last_name: last_name, first_name: first_name, age: age, fav_color: fav_color}
end

post '/lucky_number_one' do
  lucky_number_one = params[:lucky_number_one]
  fav_color = params[:fav_color]
  age = params[:age]
  last_name = params[:lname]
  first_name = params[:fname]
  redirect '/lucky_number_two?fname=' + first_name + '&lname=' + last_name + '&age=' + age + '&fav_color=' + fav_color + '&lucky_number_one=' + lucky_number_one
end

get '/lucky_number_two' do
  lucky_number_one = params[:lucky_number_one]
  fav_color = params[:fav_color]
  age = params[:age]
  last_name = params[:lname]
  first_name = params[:fname]
  erb :lucky_number_two, locals: {last_name: last_name, first_name: first_name, age: age, fav_color: fav_color, lucky_number_one: lucky_number_one}
end

post '/lucky_number_two' do
  lucky_number_two = params[:lucky_number_two]
  lucky_number_one = params[:lucky_number_one]
  fav_color = params[:fav_color]
  age = params[:age]
  last_name = params[:lname]
  first_name = params[:fname]
  redirect '/lucky_number_three?fname=' + first_name + '&lname=' + last_name + '&age=' + age + '&fav_color=' + fav_color + '&lucky_number_one=' + lucky_number_one + '&lucky_number_two=' + lucky_number_two
end

get '/lucky_number_three' do
  lucky_number_two = params[:lucky_number_two]
  lucky_number_one = params[:lucky_number_one]
  fav_color = params[:fav_color]
  age = params[:age]
  last_name = params[:lname]
  first_name = params[:fname]
  erb :lucky_number_three, locals: {last_name: last_name, first_name: first_name, age: age, fav_color: fav_color, lucky_number_one: lucky_number_one, lucky_number_two: lucky_number_two}
end

post '/lucky_number_three' do
  lucky_number_three = params[:lucky_number_three]
  lucky_number_two = params[:lucky_number_two]
  lucky_number_one = params[:lucky_number_one]
  fav_color = params[:fav_color]
  age = params[:age]
  last_name = params[:lname]
  first_name = params[:fname]
  redirect '/fav_pet?fname=' + first_name + '&lname=' + last_name + '&age=' + age + '&fav_color=' + fav_color + '&lucky_number_one=' + lucky_number_one + '&lucky_number_two=' + lucky_number_two + '&lucky_number_three=' + lucky_number_three
end


get '/fav_pet' do
  lucky_number_three = params[:lucky_number_three]
  lucky_number_two = params[:lucky_number_two]
  lucky_number_one = params[:lucky_number_one]
  fav_color = params[:fav_color]
  age = params[:age]
  last_name = params[:lname]
  first_name = params[:fname]
  erb :fav_pet, locals: {last_name: last_name, first_name: first_name, age: age, fav_color: fav_color, lucky_number_one: lucky_number_one, lucky_number_two: lucky_number_two, lucky_number_three: lucky_number_three}
end

post '/fav_pet' do
  fav_pet = params[:fav_pet]
  lucky_number_three = params[:lucky_number_three]
  lucky_number_two = params[:lucky_number_two]
  lucky_number_one = params[:lucky_number_one]
  fav_color = params[:fav_color]
  age = params[:age]
  last_name = params[:lname]
  first_name = params[:fname]
  redirect '/final_results?fname=' + first_name + '&lname=' + last_name + '&age=' + age + '&fav_color=' + fav_color + '&lucky_number_one=' + lucky_number_one + '&lucky_number_two=' + lucky_number_two + '&lucky_number_three=' + lucky_number_three + '&fav_pet=' + fav_pet
end

get '/final_results' do
  fav_pet = params[:fav_pet]
  lucky_number_three = params[:lucky_number_three].to_i
  lucky_number_two = params[:lucky_number_two].to_i
  lucky_number_one = params[:lucky_number_one].to_i
  fav_color = params[:fav_color]
  age = params[:age]
  last_name = params[:lname]
  first_name = params[:fname]
  add_total = add(lucky_number_one, lucky_number_two, lucky_number_three)
  multiply_total = multiply(lucky_number_one, lucky_number_two, lucky_number_three)
  subtract_total = subtract(lucky_number_one, lucky_number_two, lucky_number_three)
  division_total = division(lucky_number_one, lucky_number_two, lucky_number_three)
  erb :final_results, locals: {last_name: last_name, first_name: first_name, age: age, fav_color: fav_color, lucky_number_one: lucky_number_one, lucky_number_two: lucky_number_two, lucky_number_three: lucky_number_three, fav_pet: fav_pet, add_total: add_total, multiply_total: multiply_total, subtract_total: subtract_total, division_total: division_total}
end
