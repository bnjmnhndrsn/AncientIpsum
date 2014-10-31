class QuotesController < ApplicationController
  
  before_action :admin_or_redirect, only: [:edit, :update, :destroy]
  
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
  
  def admin_or_redirect
    redirect_to root_path unless current_user
  end
  
  def show
    @quote = Quote.find(params[:id])
  end
  
  def edit
    @quote = Quote.find(params[:id])
  end
  
  def update
    @quote = Quote.find(params[:id])
    @quote.update(quote_params)
    if @quote.save
      redirect_to quote_path(@quote.id)
    else
      flash.now[:errors] = @quote.errors
      render :edit
    end
  end
  
  private
  
    def quote_params
      params[:quote].permit(:content)
    end
end