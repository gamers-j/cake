class Public::DeliveryAddressController < ApplicationController
  def index
    @address = DeliveryAddress.new
  end

  def edit
  end
  
  def create
    @address = DeliveryAddress.new
    @address.save
    redirect_to
  end
  
  def update
  end
  
  def destroy
  end
  
end
