class CommentsController < ApplicationController
    before_action :authenticate_user!
def create
    @blog = Blog.find params[:blog_id]
    @comment =Comment.new params.require(:comment).permit(:body)
    @comment.blog = @blog

    if @comment.save
        redirect_to blog_path(@blog)
    else
        render 'blogs/show'    

    end
end


def destroy
    @comment= Comment.find params[:id]
    if can?(:crud,@comment)
    @comment.destroy
    redirect_to blog_path(@comment.blog)
    else
        head :unauthorized
    end
end


end
