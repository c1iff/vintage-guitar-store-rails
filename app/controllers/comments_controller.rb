class CommentsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @comments = @product.comments
    @comment = Comment.new
    render '/products/show.html.erb/'
  end

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    if @product.save
      redirect_to product_path(@product)
    else
      flash[:alert] = "Comment was not added, Please try again"
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to :back
  end

private
  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
