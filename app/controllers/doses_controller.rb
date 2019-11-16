class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end

  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete
    redirect_to cocktails_path
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient, :description)
  end
end
