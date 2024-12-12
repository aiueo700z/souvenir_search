class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params.merge(post_id: @post.id))
    if @comment.save
      flash[:notice] = 'siccess'
      redirect_to post_path(@post)
    else
      @comments = @post.comments
      flash.now[:alert] = 'failed'
      render 'posts/show'
    end

  end
  
  def destroy
    @post = @comment.post
    @comment.destroy
    flash[:notice] = 'siccess'
    redirect_to @post
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end

  def correct_user
    @comment = Comment.find_by_id(params[:id])
    redirect_to root_path if @comment&.user != current_user
  end
end
