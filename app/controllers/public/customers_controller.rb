class Public::CustomersController < ApplicationController
  def show
    @customers = Customer.find(params[:id])
  end

  def edit
    @customers = Customer.find(params[:id])
    unless @customers == current_user
    redirect_to customers_path(current_user)
    end
  end

  def unsubscribe
  end
  
  def update
  end
  
  def withdraw
  end
  
end
