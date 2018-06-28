class CommentsController < ApplicationController
  def new
    @account = Account.find(params[:account_id])
    @comment = @account.comments.new
  end

  def create
    @account = Account.find(params[:account_id])
    @comment = @account.comments.create(comment_params)
    redirect_to account_path(@account)
  end

  def destroy
    @account = Account.find(params[:account_id])
    @comment = @account.comments.find(params[:id])
    @comment.destroy
    redirect_to account_path(@account)
  end

  private

    def comment_params
      params.require(:comment).permit(:text)
    end
end
