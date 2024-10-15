class AgeVerificationController < ApplicationController
  # def show
  # end

  # def verify
  #   if params[:age] == "yes"
  #     redirect_to new_user_registration_path
  #   else
  #     redirect_to root_path, alert: "20歳以上でなければ登録できません。"
  #   end
  # end

  def new
    # 年齢確認ページを表示
  end

  def create
    if params[:age_confirmation] == "yes"
      redirect_to new_user_registration_path # Yesを選んだ場合、新規登録ページに遷移
    else
      redirect_to root_path, alert: "20歳以上の方のみご利用いただけます。" # Noを選んだ場合、ホームにリダイレクト
    end
  end

end
