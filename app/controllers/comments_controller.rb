class CommentsController < ApplicationController

  def new
     @post = Post.find(params[:post_id])
     @comment = Comment.new
  end


  def create
   @comment = Comment.new(comment_params)
   @comment.post_id = params[:post_id]
   @comment.user_id = session[:user_id]
   if @comment.save
     flash[:notice] = "Your commented has been added."
     redirect_to post_path(params[:post_id])
   else
     flash[:alert] = "Your comment could not be added. Please try again."
     redirect_to "/posts"
   end
 end

 def show
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
  end

def edit
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    @user = @comment.user_id
  end


  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
    flash[:notice] = "Your comment has been flushed."
    redirect_to post_path(params[:post_id])
  else
    flash[:alert] = "Your comment could not be flushed."
    redirect_to edit_post_comment_path(@comment)
   end
  end


private

def comment_params

  params.require(:comment).permit(:body)

end

end
