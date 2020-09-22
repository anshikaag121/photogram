class PostsController < ApplicationController

    def index
        @post = Post.all.order("created_at ASC").paginate(page: params[:page], per_page: 2)
         # @post = Post.all
          # @post = Post.paginate(:page => params[:page], :per_page => 3)
         respond_to do |format|
            format.html
            format.js
         end
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
        redirect_to root_path
        else render 'new'

        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to root_path
    end

    private

    def post_params
        params.require(:post).permit(:caption, :image)

    end
end
