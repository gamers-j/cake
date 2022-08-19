class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
    unless @customer == current_user
    redirect_to customers_path(current_user)
    end
  end

  def unsubscribe
  end

  def update
  end

  def withdraw
  end


  def customers_params
    params.require(:customers).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :address, :postal_code, :telephone_namber)
  end
end
