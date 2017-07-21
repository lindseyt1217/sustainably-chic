require 'bundler'
Bundler.require
require_relative 'models/model.rb'
class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  
  get '/results' do
    erb :results
  end

  post '/results' do
  # FOOD
  # grab user input
  answer1 = params[:food]
  answer2 = params[:byproducts]
  answer3 = params[:meals]
  # define instance variable that will be passed onto the results page
  @food_result1 = food_question1(answer1)
  @food_result2 = food_question2(answer2)
  @food_result3 = food_question3(answer3)
  @final_food_output = food_score(@food_result1, @food_result2, @food_result3)
  # FASHION
  # grab user input
  answer4 = params[:stores]
  answer5 = params[:clothes]
  # define instance variable that will be passed onto the results page
  @fashion_result1 = fashion_question1(answer4)
  @fashion_result2 = fashion_question2(answer5)
  @final_fashion_output = fashion_score(@fashion_result1, @fashion_result2)
  # FITNESS
  # grab user input
  answer6 = params[:days]
  answer7 = params[:intensity]
  # define instance variable that will be passed onto the results page
  @fitness_result1 = fitness_question1(answer6)
  @fitness_result2 = fitness_question2(answer7)
  @final_fitness_output = fitness_score(@fitness_result1, @fitness_result2)
  erb :results
  end
end