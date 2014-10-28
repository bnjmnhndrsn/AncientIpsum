class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
    render :index
  end
  
  def show
    @quote = Quote.find(params[:id])
    render :show
  end
end