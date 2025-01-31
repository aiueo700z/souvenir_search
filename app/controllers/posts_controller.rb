class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
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

  def search
    if params[:keyword].present?
      @posts = Post.joins(:souvenir).where('souvenirs.name LIKE ?', "%#{params[:keyword]}%")
    else
      @posts = Post.none
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
    flash[:notice] = "You have updated post successfully."
    redirect_to post_path(@post.id)
    # アクションを切り替える
    else
      render :edit
    end
  end


  def destroy
    @post.destroy
    redirect_to user_path(current_user.id) 
  end
  
  private

  def post_params
    params.require(:post).permit(:souvenir_name, :image, :prefecture_id, :category_id, :caption, :comment)
  end

  def correct_user
    @post = Post.find_by_id(params[:id])
    redirect_to root_path if @post&.user != current_user
  end
end
