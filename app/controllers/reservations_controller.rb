class ReservationsController < ApplicationController
  def new
    @res = Reservation.new
  end
  def create
    @res = Reservation.new(res_params)
    if @res.save
      redirect_to root_path, flash: { notice: 'Reservations made.' }
    else
      flash.now[:alert] = 'Could not make these reservations.'
      render :new
    end
  end
  def destroy
    @res = Reservation.find(params[:id])
    @res.destroy
    redirect_to root_path, flash: { notice: 'Reservations cancelled!' }
  end
  def res_params
    params.require(:reservation).permit(:party_size,:reservation_date)
  end
end
