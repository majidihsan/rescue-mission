class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order("id desc").limit(5)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order("id desc").limit(5)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @answers = @question.answers
    if @question.destroy
      @answers.destroy
      redirect_to questions_path
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
       redirect_to questions_path
     else
       render :edit
     end
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :description)
    end
end
