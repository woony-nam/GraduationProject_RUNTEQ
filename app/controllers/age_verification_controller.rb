class AgeVerificationController < ApplicationController
  def show
  end

  def verify
    if params[:age] == "yes"
      redirect_to new_user_registration_path
    else
      redirect_to root_path, alert: "20歳以上でなければ登録できません。"
    end
  end
end
