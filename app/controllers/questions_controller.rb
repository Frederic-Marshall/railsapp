class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update show destroy edit]
  before_action :request_authenticity_tokens, except: %i[show index]
  before_action :authorize_question!
  after_action :verify_authorized
  
  def create
    @question =Question.create(question_params)

    @question.user_id = current_user.id

    if @question.save
      redirect_to question_path(@question), notice: 'Новый вопрос успешно создан'
    else
      redirect_to root_path, alert: 'Пожалуйста, введите данные'
    end
  end

  def update
    @question.update(question_params)
    
    redirect_to question_path(@question), notice: 'Вопрос успешно обновлён'
  end

  def destroy
    @question.destroy
    
    redirect_to questions_path, notice: 'Вопрос успешно удалён'
  end

  def show
  end

  def index 
    @question = Question.new
    @questions = Question.all 
  end
  
  def new
    @question = Question.new
  end

  def edit
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id, :category_id, :file)
  end

  def set_question
    @question = Question.find(params[:id])
  end
  
  def authorize_question!
    authorize(@question || Question) 
  end
end
