class HomesController < ApplicationController
  def top
    @prefectures = Prefecture.all
    @posts = Post.all
    @posts = Post.all.page(params[:page])
    @posts = @posts.where(prefecture_id: params[:prefecture_id]) if params[:prefecture_id].present?
  end

  def about
  end
end
