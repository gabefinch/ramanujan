class NumberController<ApplicationController
  def index
    @numbers = Number.all
  end
  def new
    @number = Number.create
  end
  def create
    @number = Number.create(number_params)
    @number.user_id = current_user
    if @number.save
      flash[:notice] = Your number was added.
      # redirect_to user_path
    else
      # redirect_to 
    end
  end
end
