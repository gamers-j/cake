class Public::DeliveryAddressesController < ApplicationController
  def index
    @address = DeliveryAddress.new
  end

  def edit
  end
  
  def create
    @address = DeliveryAddress.new
    @address.save
    redirect_to delivery_addresses_path
  end
  
  def update
  end
  
  def destroy
  end
  
end
