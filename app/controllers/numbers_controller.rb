class NumbersController<ApplicationController

  def index
    @numbers = Number.all
  end

  def new
    @number = Number.new
  end

  def create
    @number = Number.new(number_params)
    @number.user = current_user
    if @number.save
      flash[:notice] = "Your number was added."
      redirect_to home_path
    else
      # redirect :back
    end
  end

private
  def number_params
    params.require(:number).permit(:name, :phone)
  end
end
