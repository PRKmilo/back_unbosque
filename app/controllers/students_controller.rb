class StudentsController < ApplicationController

  def index
    @graduates = User.joins(:student)
    json_response = @graduates.map do |user|
      {
      id: user.id,
      name: user.name,
      email: user.email,
      cc: user.cc,
      lastname: user.lastname,
      direccion: user.direccion,
      student: {
        faculty: user.student.faculty,
        carer: user.student.carerr
      },
      type: user.type
      }
    end
    render json: json_response, status: :ok
  end

  def show
    @user = User.find(params[:id])
    json_response = {
    id: @user.id,
    name: @user.name,
    email: @user.email,
    edad: @user.edad,
    cc: @user.cc,
    lastname: @user.lastname,
    direccion: @user.direccion,
    celular: @user.celular,
    telofono: @user.telefono,
    student: {
    faculty: @user.student.faculty,
    carerr: @user.student.carerr
    }
    }
    render json: json_response , status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end
  private 
  def set_graduate
    @user = User.find(params[:id])
  end

  def graduate_params
    params.require(:graduate).permit(:name,:lastname,:email,:edad,:photo,:cc,:direccion,:celular,:telofono,:password)
  end
end
