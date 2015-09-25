class AdvertisementsController < ApplicationController
  def index
  	@advertisements = Advertisement.all
  end

  def show
  	@advertisement = Advertisement.find(params[:id])
  end

  def new
  	@advertisement = Advertisement.new
  end

  def create
  	@advertisement = Advertisement.new(params.require(:advertisement).permit(:copy, :title, :price))

  	if @advertisement.save
  		redirect_to @advertisement, notice: "Ad created"
  	else
  		flash[:error] = "Something went wrong"
  		render :new
  	end
  end

  def edit
  	@advertisement = Advertisement.find(params[:id])
  end

  def update
  	@advertisement = Advertisement.find(params[:id])

  	if @advertisement.update_attributes(params.require(:advertisement).permit(:copy, :title, :price))
  		redirect_to @advertisement, notice: "Ad updated!"
  	else
  		flash[:error] = "Something went wrong"
  		render :edit
  	end
  end

  def destroy
  	@advertisement = Advertisement.find(params[:id])

  	if @advertisement.destroy
  		redirect_to advertisements_path, notice: "Ad deleted"
  	else
  		flash[:error] = "Something went wrong"
  		render :show
  	end
  end
end 
