class BloggersController < ApplicationController
    def show
        @blogger = Blogger.find(params[:id])
        @likes = @blogger.posts.map { |post| post.likes }.reduce(0, :+)
        @featured = @blogger.posts.max_by { |post| post.likes }
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.save
            redirect_to @blogger
        else
            render :new
        end
    end

    private

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end
end
