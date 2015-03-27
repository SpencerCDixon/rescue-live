class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :fetch_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all.limit(10)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Successfully created question"
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to questions_path
  end

  def edit
    authorize_owner!(@question)
  end

  def update
    if @question.update(question_params)
      flash[:notice] = "Successfully edited question"
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to questions_path
  end

  def destroy
    if @question.destroy
      flash[:notice] = "Question deleted"
    else
      flash[:alert] = "Something went wrong"
    end

    redirect_to questions_path
  end

  private

  def authorize_owner!(question)
    if !(question.user == current_user)
      flash[:alert] = "You are not authorized to do that"
      redirect_to question_path(question)
    end
  end

  def fetch_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
