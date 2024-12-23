class HomesController < ApplicationController
  def top
    @prefectures = Prefecture.all
    @posts = Post.all
    @posts = @posts.where(prefecture_id: params[:prefecture_id]) if params[:prefecture_id].present?
    #@post = Post.new
  end

  def about
  end
end
