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
        format.js {}
  	  else
        format.js {}
  	  end
    end
  end

  private
  def category_params
  	params.require(:category).permit(:name, :user_id)
  end
end
