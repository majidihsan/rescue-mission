class AnswersController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def update
    @best_answer = Answer.find(params[:id])
    @question = @best_answer.question
    @answer = Answer.new
    @answers = @question.answers

    @best_answer.best_answer = true
    @best_answer.save
    redirect_to question_path(@question)
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      flash[:notice] = "Answer saved successfully."
      redirect_to question_path(@question)
    else
      flash[:alert] = "Failed to save answer."
      render :new
    end
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end
