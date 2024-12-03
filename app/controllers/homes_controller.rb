class HomesController < ApplicationController
  def top
    @posts = Post.all
    @post = Post.new
  
  end


  def about
  end
  
end
