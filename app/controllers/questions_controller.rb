require 'open-uri'
require 'json'

class QuestionsController < ApplicationController
  def new
    @letters = Array.new(10).map { |_| ("A".."Z").to_a.sample }
  end


  def score
    grid = params[:grid].split(' ')
    word = params[:letters].upcase.chars
    in_grid = word.each do |letter|
      booleans = []
      if grid.include?(letter)
        booleans << true
        index = grid.index(letter)
        grid.delete_at(index)
      else booleans << false
      end
      booleans.all?
    end

    url = "https://wagon-dictionary.herokuapp.com/#{params[:letters]}"
    valid = JSON.parse(open(url).read)['found']

    @try = "Well done !"
    @try = "not in the grid" if !in_grid
    @try = "not an english word" if !valid

  end
end
