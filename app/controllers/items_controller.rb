class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
  end

  def index
    @page = params[:page]
    @pagy, @items = pagy(Item.all, items: 1, page: @page)
    render json: @items
  end

  def create
    @item = Item.new(params.permit(:name))
    @item.owner = User.find(6)
    if @item.save
      render json: @item, status: :created
    else
      render json: @item.errors, status: 400
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(name: params.permit(:name))
    render json: @item
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    render json: @item
  end

  def show
    @item = Item.find(params[:id])
    render json: @item
  end
end
