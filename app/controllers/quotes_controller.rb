class QuotesController < ApplicationController
  def index
    query = Quote.all
    query = query.order("ABS(length - #{params[:length]})") unless params[:length].nil?
    query = query.limit(params[:num]) unless params[:num].nil?
    @quotes = query
    if params[:json] == 'true'
      render json: @quotes
    else
      render :index
    end
    
  end
  
  def show
    @quote = Quote.find(params[:id])
  end
end