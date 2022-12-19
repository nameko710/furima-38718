class PurchaseRecordsController < ApplicationController
  def index
    @purchase_record = PurchaseRecord.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_record = PurchaseRecord.create(purchase_record_params)
    DeliveryAddress.create(delivery_address_params)
    redirect_to root_path
  end

  def purchase_record_params
    params.permit().merge(user_id: current_user.id, item_id: @item.id)
  end

  def delivery_address_params
    params.permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(purchase_record_id: @purchase_record.id)
  end

                        
end
