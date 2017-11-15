class PollAnswersController < ApplicationController

  before_action :authenticate_store!, except:[:update]

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
    @store = Store.find(1);
    @camp = StoreCampaign.find(@store.store_campaign_id)

    if @camp.sms_status
      redirect_to(pages_phone_path)
    else
      redirect_to(pages_code_path)
    end
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
