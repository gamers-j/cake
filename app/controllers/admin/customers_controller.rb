class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(product_params)
    redirect_to admin_product_path(@customer.id)
  end

  private

  def product_params
  params.require(:product).permit(:type_id,:name,:introduction,:nontaxed_price,:is_active)
  end
end
