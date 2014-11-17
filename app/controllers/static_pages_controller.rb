require 'json'

class StaticPagesController < ApplicationController
  def random
    @quote = Quote.find(rand(Quote.count))
    render :random
  end
  
  def search
    render :search
  end
  
  def root
     @quote = Quote.find(rand(Quote.count))
  end

end