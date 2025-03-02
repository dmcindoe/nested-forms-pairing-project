class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
    @doctor.patients.build(name: "Honey")
    @doctor.patients.build(name: "Zelda")
  end

  def create
    Doctor.create(doctor_params)
    redirect_to doctors_path
  end

  private

  def doctor_params
    params.require(:doctor).permit(
      :name,
      patients_attributes: [
        :name,
        :age
      ]
    )
  end
end
