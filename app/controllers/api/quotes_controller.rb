class Api::QuotesController < ApplicationController
  def index
    query = Quote.all
    query = query.order("ABS(length - #{params[:length]})") if params[:length]
    query = query.limit(params[:num]) if params[:num]
    @quotes = query
    render json: @quotes
  end
  
end
