
require "json"
require "open-uri"

class GamesController < ApplicationController

  def new
    grid_size = 10
    @alphabet = Array.new(grid_size) { ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:mot].downcase
    @alphabet = params[:alphabet].downcase.split
    array = @word.chars
    @goodgrid = array.all? { |letter| array.count(letter) <= @alphabet.count(letter) }

    @url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    word_serialized = URI.open(@url).read
    verification = JSON.parse(word_serialized)

    @goodword = verification["found"]

  end

end
