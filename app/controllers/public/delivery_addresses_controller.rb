class Public::DeliveryAddressesController < ApplicationController
  def index
    @address = DeliveryAddress.new
    @addresses = current_customer.delivery_addresses
  end

  def edit
  end
  
  def create
    @address = DeliveryAddress.new(delivery_address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to delivery_addresses_path
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def delivery_address_params
    params.require(:delivery_address).permit(:postal_code, :name, :address)
  end
  
end
