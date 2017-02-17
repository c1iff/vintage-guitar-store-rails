class CartsController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @products = @user.products
    @sub_total = 0
    @products.each do |product|
      @sub_total += product.get_price
    end
  end


  def create
    @product = Product.find(params[:product_id])
    @comments = @product.comments
    @cart = @product.carts.new(user_id: current_user.id, product_id: @product.id)
    if @product.save
      render '/products/show.html.erb/'
    else
      flash[:alert] = "An error occured, the product was not added, Please try again"
      redirect_to :back
    end
  end

  # def edit
  #   @product = Product.find(params[:product_id])
  #   @comment = Comment.find(params[:id])
  # end
  #
  # def update
  #   @product = Product.find(params[:product_id])
  #   @comment = Comment.find(params[:id])
  #   @comment.update(comment_params)
  #   if @comment.save
  #     redirect_to product_path(@product)
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @comment = Comment.find(params[:id])
  #   @comment.delete
  #   redirect_to :back
  # end

private
  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
