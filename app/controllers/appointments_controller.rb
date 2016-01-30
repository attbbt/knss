class AppointmentsController < ApplicationController

  def index
    @app_creates = @current_user.role == 'receptionist' ? Appointment.where("date_of_visit > ?", Date.current) : []
  end

  def new
    @app_create = Appointment.new
  end

  def show
    @app_creates = Appointment.all
  end

  def edit
    @app_create = Appointment.find(params[:id])
  end

  def update
    @app_create = Appointment.find(params[:id])
    if @app_create.update_attributes(appointment_params)
      flash[:success] = "Successfully updated"
      redirect_to users_path
    else
      flash[:error] = "Something went wrong"
      render :edit
    end
  end

  def create
    @app_create = Appointment.new(appointment_params)
    if @app_create.save
      flash[:success] = "Successfully Created an Appointment"
      redirect_to users_path
    else
      flash[:error] = "Something went wrong"
      render :new
    end

    def destroy
      @app_create= Appointment.find(params[:id])
      @app_create.destroy
      redirect_to :back
    end

  end

  private
  def appointment_params
    params.require(:appointment).permit(:date_of_visit, :customer_id,:pet_id, :requires_reminder, :reason_for_visit, :doctor_id)
  end

end






