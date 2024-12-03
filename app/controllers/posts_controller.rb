class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
  end

  def index
    @posts = Post.all
  end

  def create
    @user = current_user
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
    
  end

  def destroy
    post = Post.find(params[:id])  
    post.destroy  
    redirect_to user_path  
  end
  
  private

  def post_params
    params.require(:post).permit(:souvenir_name, :image, :prefecture_id, :category_id, :caption )
  end
end
