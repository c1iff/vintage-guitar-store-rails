class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @comments = Comment.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
   if @product.save
     flash[:notice] = "Product added"
     redirect_to products_path
   else
     flash[:alert] = "Please try again"
     redirect_to :back
   end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price, :picture)
    end
end
