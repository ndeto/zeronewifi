class PollsController < ApplicationController
  
  def edit
    @question = Question.find(params[:id])
    set_admin
  end
  
  def update
    @question = Question.find(params[:id])
    @question = @question.update(question_params)
    
    if @question
      flash[:notice] = "Poll Successfully Updated"
      redirect_to(request.referer)
    else
      flash[:notice] = "Something went wrong! Please try again"
      redirect_to(request.referer)
    end
  end
  
  
  private
  
  def question_params
    params.require(:question).permit(:question)
  end
  
end
