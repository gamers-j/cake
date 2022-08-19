class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @products = Product.new
  end

  def show
    # @products = Product.find(params[:id])
  end

  def edit
  end

  def create
  end

  def update
  end

end
