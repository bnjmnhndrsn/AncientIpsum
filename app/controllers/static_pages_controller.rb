require 'json'

class StaticPagesController < ApplicationController
  def random
    @quote = Quote.find(rand(Quote.count))
    render :random
  end
  
  def search
    render :search
  end
  
  def results
    query = Quote.all
    query = query.order("ABS(length - #{params[:length]})") unless params[:length].nil?
    query = query.limit(params[:num]) unless params[:num].nil?
    @quotes = query
    if params[:json] == 'true'
      render json: @quotes
    else
      render 'quotes/index'
    end
  end

end