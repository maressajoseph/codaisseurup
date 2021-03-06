class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @registration = current_user.registrations.create(registration_params.merge(event_id: params[:event_id]))
    @registration.save

    redirect_to @registration.event, notice: "Thank you for registering!"
  end

  private

  def registration_params
    params.require(:registration).permit(:status, :guests_count)
  end
end
