class UsersController < ApplicationController
  def show
    @post = Post.new
    @user = User.find(params[:id])
    @posts = @user.posts
    
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
