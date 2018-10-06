class CommentsController < ApplicationController
  before_action :require_login
  #before_action :authenticate_user!,
  before_action :user_or_admin, only: [:index]

  def index
    @account = Account.find(params[:account_id])
    @comments = @account.comments
  end

  def new
    @account = Account.find(params[:account_id])

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
    # @comment = @account.comments.find(params[:id])
    @comment_group = []
    @account.comments.each { |comment| @comment_group << comment }
    p @comment_group
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

    def user_or_admin
      Account.find(params[:account_id]).user == current_user || current_user.admin?
    end

    def require_login
      redirect_to login_url unless current_user
    end
end
