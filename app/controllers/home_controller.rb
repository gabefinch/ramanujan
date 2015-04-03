class HomeController<ApplicationController
  def index
  end

  def user
    @user = current_user
  end
end
