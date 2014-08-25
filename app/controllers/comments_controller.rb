class CommentsController < ApplicationController
 before_action :authenticate_user!


  def new
    @comment = Comment.new
  end



  def create

   @comment = current_user.comments.build(comment_params)
   @comment.user = current_user
   @comment.save
   redirect_to posts_path

  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end





  def comment_params
    params.require(:comment).permit(:content)
  end

end
