class Public::DeliveryAddressesController < ApplicationController
  def index
    @address = DeliveryAddress.new
    @addresses = current_customer.delivery_addresses
  end

  def edit
    @address = DeliveryAddress.find(params[:id])
    unless @address.customer == current_customer
    redirect_to delivery_addresses_path
    end
  end

  def create
    @address = DeliveryAddress.new(delivery_address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to delivery_addresses_path
  end

  def update
    @address = DeliveryAddress.find(params[:id])
    @address.update(delivery_address_params)
    redirect_to delivery_addresses_path
  end

  def destroy
    @address = DeliveryAddress.find(params[:id])
    @address.destroy
    redirect_to delivery_addresses_path
  end

  private
  def delivery_address_params
    params.require(:delivery_address).permit(:postal_code, :name, :address)
  end

end
