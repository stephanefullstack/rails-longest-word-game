require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('a'..'z').to_a.sample }
  end

  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    word_serialized = open(url).read
    word = JSON.parse(word_serialized)
    exist = word["found"]

    # puts "#{user['name']} - #{user['bio']}"

    @word = params[:word].split("")
    @letters = params[:letters].split(" ")
    p @word
    p @letters
    p exist
    if exist && @word.all? { |item| @word.count(item) <= @letters.count(item)}
      @greating = 'Yay'
    else
      @greating = 'Sorry, try again'
    end
    @greating
  end
end
