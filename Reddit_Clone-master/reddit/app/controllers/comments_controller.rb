class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    # debugger
    if @comment.save
      if @comment.parent_comment_id.nil? 
        redirect_to post_url(@comment.post)
      else
        redirect_to comment_url(@comment.parent_comment_id)
      end
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end
  
  def show
    @comment = Comment.find(params[:id])
    @all_child_comments = @comment.child_comments
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end
  
end
