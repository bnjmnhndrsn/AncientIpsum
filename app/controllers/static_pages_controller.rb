require 'json'

class StaticPagesController < ApplicationController
  def random
    @quote = Quote.find(rand(Quote.count))
    render 'quotes/show'
  end
  
  def search
    render :search
  end

end