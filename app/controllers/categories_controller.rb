class CategoriesController < ApplicationController
  
  def index
  	@category = Category.all
  end
  
  def new
    @category = Category.new
  end

  def create
  	@category = current_user.categories.new(category_params)
	  respond_to do |format|
      if @category.save
        format.json { render json: @category }
  	  else
        format.json { render json: @category.errors.full_messages }
  	  end
    end
  end

  private

    def category_params
    	params.require(:category).permit(:name)
    end
end
