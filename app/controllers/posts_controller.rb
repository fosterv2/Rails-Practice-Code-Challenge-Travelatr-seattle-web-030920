class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update]
    
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to post_path
        else
            render :new
        end
    end

    def update
        if @post.update(post_params)
            redirect_to post_path
        else
            render :edit
        end
    end

    private

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end
