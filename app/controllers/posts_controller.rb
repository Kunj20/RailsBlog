class PostsController < ApplicationController

  def index
    @posts = Post.all.order("created_at DESC")
  end

def show
  @post = Post.find(params[:id])
end


def new
  @post = Post.new
end



def create
  @post = Post.create(
       user_id: session[:user_id],
       title: params[:post][:title],
       content: params[:post][:content]
     )

    redirect_to "/posts"
  end

# what displays all the posts

def show
  @post = Post.find(params[:id])
  @user = User.find(@post.user_id)
end

# allows user to edit post

def edit
@post = Post.find(params[:id])
end

# saves edit

def update
	@post = Post.find(params[:id])
	@post.title = params[:post][:title]
	@post.content = params[:post][:content]

  if @post.save
       flash[:notice] = "Changes saved!"
       redirect_to post_path(@post)
     else
       flash[:alert] = "Unable to save changes"
       redirect_to edit_post_path(@post)
     end
   end

  def destroy
    Post.destroy_all
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Deleted"
      session[:post_id] = nil
      redirect_to "/posts"
    else
      flash[:alert] = "Try again!"
      redirect_to "posts/edit"
    end
  end

private
  def post_params
    params.require(:post).permit(:title, :content, :created_at, :uname)
  end
end
