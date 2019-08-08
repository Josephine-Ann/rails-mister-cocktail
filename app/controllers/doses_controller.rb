class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def destroy
    @dose = Dose.find(params[:id].to_i)
    if @dose.destroy
      redirect_to dose_path
    else
      render :index
    end
  end

  def create
    @dose = Dose.new(dose_strong_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  private

  def dose_strong_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end

