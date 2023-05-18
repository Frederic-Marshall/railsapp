class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all  
  end

  def show
	@questions = Question.where(category_id: [@category.id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path, notice: 'Учебная дисциплина успешно создана'
    else
      flash[:alert] = 'Учебная дисциплина не создана'
      render :new
    end
  end

  def edit
	end

	def update 
		if @category.update(category_params)
			redirect_to root_path, notice: 'Учебная дисциплина успешно обновлена'
		else
			flash[:alert] = 'Учебная дисциплина не обновлена'
			render :edit
		end
	end

	def destroy
		@category.destroy

		redirect_to root_path, notice: 'Учебная дисциплина успешно удалена'
	end

	private 

	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:name, :parent_id)
	end
end
