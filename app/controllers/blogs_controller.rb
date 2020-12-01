class BlogsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show, ]
    before_action :authorize_user!, only:[:edit,:update, :destroy]
    def index
        @blog = Blog.all
    end
    
    def new
        @blog = Blog.new
        
    end

    def create
       
        @blog = Blog.new params.require(:blog).permit(:title, :body)
            @blog.user = current_user
            if @blog.save
                flash[:notice] = "Blog created successfully"
                redirect_to blog_path(@blog)
            else
                render :new
            end

               
    end

    def show
        @blog = Blog.find params[:id]
        @comment = Comment.new
        @comments = @blog.comments
    end

    def edit
        @blog = Blog.find params[:id]
       
    end

    def update
        @blog = Blog.find params[:id]
        @blog.user = current_user
        
        if @blog.update params.require(:blog).permit(:title, :body)
            @blog.save
            redirect_to blog_path(@blog)
        else
            render :edit    
        end
    
    end

    def destroy
        @blog = Blog.find params[:id]
       
            if can?(:crud, @blog)
               @blog.destroy
               redirect_to root_path
            else
                head :unauthorized
            end
    end

    def authorize_user!
        redirect_to root_path, alert:"Not Authorized" unless can?(:crud, @blog)
      end
end


