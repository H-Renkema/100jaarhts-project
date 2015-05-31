# Photoalbums controller
class PhotoalbumsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @photoalbums = Photoalbum.all
  end

  def new
    @photoalbum = Photoalbum.new
    @photoalbum.name = 'Albumnaam'
  end

  def create
    photoalbum = Photoalbum.new(photoalbum_params)
    photoalbum.save

    redirect_to photoalbums_path
  end

  def photoalbum_params
    params.require(:photoalbum).permit(:name)
  end

  def show
    @photoalbum = Photoalbum.find(params[:id])
  end

  def edit
    @photoalbum = Photoalbum.find(params[:id])
  end

  def update
    @photoalbum = Photoalbum.find(params[:id])
    @photoalbum.update(photoalbum_params)

    if @photoalbum.save
      redirect_to photoalbums_path, notice: 'Your post has been updated'
    else
      render 'edit'
    end
  end

  def destroy
    @photoalbum = Photoalbum.find(params[:id])
    @photoalbum.destroy
    redirect_to photoalbums_path, notice: 'Your post has been deleted!'
  end
end
