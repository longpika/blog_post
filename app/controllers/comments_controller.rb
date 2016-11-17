class CommentsController < ApplicationController
  def new
    if current_account
      @comment = current_account.comments.new
    else
      redirect_to "/"
    end
  end

  def create
    if current_account
      @comment = current_account.comments.new
      @comment.commentable_id = params[:id]
      @comment.commentable_type = "Blog"
      @comment.content = params[:content]
      if @comment.save
        render :json => { stt: "Success" }
      else
        redirect_to "/"
      end
    else
      redirect_to "/"
    end
  end
end
