class StaticPagesController < ApplicationController
  def random
    @quote = Quote.find(rand(Quote.count))
    render :random
  end
end