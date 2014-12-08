class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was created successfully.'
    else
      render.new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
      if @product.save
      redirect_to products_path, notice: 'Product was successfully updated.'
    else
      render:edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
      redirect_to products_path, notice: 'Product was successfully deleted.'
  end



private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :created_at, :updated_at)
  end

end
