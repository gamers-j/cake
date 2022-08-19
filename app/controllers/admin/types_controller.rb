class Admin::TypesController < ApplicationController
  def index
    @type = Type.new
    @types = Type.all
  end

  def edit
    @type = Type.find(params[:id])
  end
  
  def create
    @type = Type.new(type_params)
    if @type.save
       redirect_to admin_types_path
    else
      @types = Type.all
      render admin_types_path
    end
  end
  
  def update
    @type = Type.find(params[:id])
    if @type.update(type_params)
       redirect_to admin_types_path
    else
      render edit_admin_type_path
    end
  end
  
  private
  # ストロングパラメータ
  def type_params
    params.require(:type).permit(:name)
  end
  
end
