class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def new

  end

  def create
    @bands = Band.new(band_params)
    if @bands.save
      redirect_to bands_url
    else
      flash.now[:duped_band] = "Band already added."
      render :new
    end
  end

  def edit
  end

  def show

  end

  def update
  end

  def destroy
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
