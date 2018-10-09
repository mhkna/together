class SharedController < ApplicationController
  before_action :require_login
  before_action :round_happening

  private

    def require_login
      redirect_to login_path unless current_user
    end

    def round_happening
      happening_now = round_in_progress?
      has_entry = user_in_round?
      if happening_now && has_entry
        redirect_to round_path(current_round)
      elsif happening_now && !has_entry
        redirect_to wait_path
      end
    end
end
