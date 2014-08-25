class PostsController < ApplicationController
  before_action :authenticate_user!


  def index
    @users = User.all
    @posts = Post.all
    @comments = Comment.all
    @post = current_user.posts.build
    @comment = @post.comments.build
  end




  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post successfully created'
    else
      flash[:danger] = 'Post cannot be blank'
    end
    redirect_to posts_path
  end


  def destroy
 # make delete method
  end








  private

      def post_params
        params.require(:post).permit(:post_id, :content)
      end
end
