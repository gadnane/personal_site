class PostsController < ApplicationController

  def index
  	@posts = Post.all
  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  def edit
	@post = Post.friendly.find(params[:id])
  end

  def update
    @post = Post.friendly.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

def new
  	@post = Post.new
  end

def create
  	@post = Post.new(post_params)
    if @post.save
      	flash[:success] = "Post Created"
      	redirect_to @post
    else
      	render 'posts/new'
    end
  end

 def destroy
    Post.friendly.find(params[:id]).destroy
    flash[:success] = "Post deleted"
    redirect_to posts_path
  end


  private

    def post_params
      params.require(:post).permit(:title, :content, :slug)
    end

end
