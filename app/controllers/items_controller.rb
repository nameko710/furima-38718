class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(items_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def items_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :delivery_charge_id,
                                 :prefecture_id, :duration_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    prototype = Item.find(params[:id])
    redirect_to root_path unless current_user.id == prototype.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
