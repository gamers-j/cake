class Public::DeliveryAddressesController < ApplicationController
  def index
    @address = DeliveryAddress.new
    @address = DeliveryAddress.all
  end

  def edit
  end
  
  def create
    @address = DeliveryAddress.new
    @address.save
    redirect_to delivery_addresses_path(@address.id)
  end
  
  def update
  end
  
  def destroy
  end
  
end
