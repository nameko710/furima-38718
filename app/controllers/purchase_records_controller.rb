class PurchaseRecordsController < ApplicationController
  def index
    @purchase_record = PurchaseRecord.new
    @item = Item.find(params[:item_id])
  end
end
