class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
    @answer = Answer.new
  end

  def new
    @question = Question.new

  end

  def edit
	if @question.user == current_user
		render :edit
	else
		redirect_to @question, alert: "You can only edit your own questions."
	end
  end

  
  def create
    @question = Question.new(question_params)
    @question.user = current_user
	@question.user.points -= 10
	if @question.save
	@question.user.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end

  end

 def update
	@question = Question.find(params[:id])
	if @question.update_attributes(question_params)
		redirect_to @question, notice: 'Question was successfully updated.'
	else
		redirect_to @question, alert: "There was a problem with updating your question."
	end
 end
 

  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :contents, :password,
                                   :password_confirmation)
    end
end
