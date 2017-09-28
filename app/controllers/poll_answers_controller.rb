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

  def update
    @answer = PollAnswer.find(params[:count][:count])
    count = @answer.count + 1
    @answer.update(count:count)
    redirect_to("http://192.168.7.1/login?username=57EDBGH3&password=57EDBGH3")
  end

  def show
    @camp = StoreCampaign.find(params[:id])
    @question = @camp.question
    @answers = @question.poll_answer.all.order(:created_at)
  set_admin
  end
  
  
  private
  
  def poll_answer_params
    params.require(:poll_answer).permit(:answer,:count)
  end
end
