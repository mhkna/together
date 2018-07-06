class CommentsController < ApplicationController
  def index
    @account = Account.find(params[:account_id])
    @comments = @account.comments
  end

  def new
    @account = Account.find(params[:account_id])
    @comment = @account.comments.new
  end

  def create
    @account = Account.find(params[:account_id])
    @comment = @account.comments.create(comment_params)
    redirect_to account_url(@account)
  end

  def edit
    @account = Account.find(params[:account_id])
    @comment = @account.comments.find(params[:id])
  end

  def update
    @account = Account.find(params[:account_id])
    @comment = @account.comments.find(params[:id])

    if @comment.update_attributes(comment_params)
      redirect_to account_url(@account)
    else
      render 'edit'
    end
  end

  def destroy
    @account = Account.find(params[:account_id])
    @comment = @account.comments.find(params[:id])
    @comment.destroy
    redirect_to account_url(@account)
  end

  private

    def comment_params
      params.require(:comment).permit(:text)
    end
end
