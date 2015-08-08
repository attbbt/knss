class UsersController < ApplicationController

  def index
    @current_user = User.find(session[:current_user])
    @doctors = @current_user.access_for_doctors
    @appointment_pets = @current_user.pets_through_appointments
    @pets = @current_user.pets
  end

  def edit
    @doctor = User.find(params[:id])
  end

  def update
    @doctor = User.find(params[:id])
    if @doctor.update_attributes(user_params)
      flash[:success] = "Successfully updated"
      redirect_to action: :index
    else
      flash[:error] = "Something went wrong"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :city, :state, :zip, :year_in_practice, :email, :password)
  end

end