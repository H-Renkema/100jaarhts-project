# photo's controller
class PhotosController < ApplicationController
  def create
    @photoalbum = Photoalbum.find(params[:photoalbum_id])
    @photo = @photoalbum.photos.create(photo_params)
    redirect_to photoalbum_path(@photoalbum)
  end

  def destroy
    @photoalbum = Photoalbum.find(params[:photoalbum_id])
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photoalbum_path(@photoalbum), notice:
    'Your post has been deleted!'
  end

  private

  def photo_params
    params.require(:photo).permit(:file_name)
  end
end
