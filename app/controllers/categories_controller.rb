class CategoriesController < ApplicationController
  
  def index
  	@category = Category.all
  end
  
  def new
    @category = Category.new
  end

  def create
  	@category = current_user.categories.new(category_params)
  	 if @category.save
  	 	redirect_to root_path
  	 else
  	 	redirect_to :back
  	 end
  end

  private
  def category_params
  	params.require(:category).permit(:name, :user_id)
  end
end
