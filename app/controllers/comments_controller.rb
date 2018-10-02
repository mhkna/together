class CommentsController < ApplicationController
  def index
    @account = Account.find(params[:account_id])
    @comments = @account.comments
  end

  def new
    @account = Account.find(params[:account_id])
    # @comment = @account.comments.new

    @comment_group = []
    (@account.match_amount).times do
      @comment_group << @account.comments.new
    end
  end

  def create
    @account = Account.find(params[:account_id])

    comment_params[:comment_group].each do |comment_hash|
      if comment_hash[:text] != ""
        @account.comments.create(comment_hash)
      end
    end
    
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
      params.permit(comment_group: [:text])
    end
end
