module SessionsHelper
  # 渡されたユーザでログイン
  def log_in(user)
    session[:user_id] = user.id
  end

  # 現在ログイン中のユーザーを返す(存在する場合)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ユーザがログインしていれば true, していなければ false
  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
