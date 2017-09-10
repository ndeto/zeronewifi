class PollAnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.poll_answer.create(poll_answer_params.merge(count:0))
  end

  def destroy
    @answer = PollAnswer.find(params[:id])
    @question = Question.find(@answer.question_id)
    @answer.destroy
  end
  
  
  private
  
  def poll_answer_params
    params.require(:poll_answer).permit(:answer,:count)
  end
end
