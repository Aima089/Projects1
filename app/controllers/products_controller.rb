class ProductsController < ApplicationController
  def index
    @products = Product.where(company_id: current_user.company_id)
  end 

  def new
    @product = Product.new
  end

  def create
    if current_user && current_user.current_company
      @product = current_user.current_company.products.new(product_params)
      @product.user_id = current_user.id

      if @product.save
        redirect_to products_path, notice: 'Product was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :color, :price, :product_type)
  end
end
