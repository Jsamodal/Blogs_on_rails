class BlogsController < ApplicationController
    
    def index
        @blogs = Blog.all
    end
    
    def new
        @blogs = Blog.new
    end

    def create
        @blogs = Blog.new params.require(:blog).permit(:title, :body)
            if @blogs.save
                flash[:notice] = "Blog created successfully"
                redirect_to blog_path(@blogs)
            else
                render :new
            end
    end

    def show
        @blogs = Blog.find params[:id]
    end

    def edit
        @blogs = Blog.find params[:id]
    end

    def update
        @blogs = Blog.find params[:id]
        if @blogs.update params.require(:blog).permit(:title, :body)
            redirect_to blog_path(@blogs)
        else
            render :edit    
        end
    
    end

    def destroy
        @blogs = Blog.find params[:id]
        @blogs.destroy
        redirect_to blogs_path
    end
end
