class CommentsController < ApplicationController
  before_action :set_product
  before_action :authenticate_user!, only: %i[create destroy update]

  def create
    @comment = @product.comments.create(comment_params.merge(user_id: current_user.id))

    if @comment.save
      flash[:success] = 'Comment successfully added!'
    else
      flash[:danger] = 'Something wrong, sorry!'
    end
    redirect_to product_path(@product)
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = 'Comment successfully updated!'
    else
      flash[:danger] = 'Something wrong, sorry!'
    end
    redirect_to product_path(@product)
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    flash[:danger] = 'Comment deleted!'
    redirect_to product_path(@product)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :rating, :product_id, :user_id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
