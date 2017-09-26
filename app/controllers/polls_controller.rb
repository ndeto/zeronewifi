class PollsController < ApplicationController
  
  def edit
    @question = Question.find(params[:id])
    @storecampaign = StoreCampaign.where(id:@question.store_campaign_id).first
    puts @storecampaign
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

  def submit_poll
    @question = Question.find(params[:id])
    @question = @question.update(question_params)

    if @question
      redirect_to("http://192.168.7.1/login?username=57EDBGH3&password=57EDBGH3")
    else
      redirect_to(request.referer)
    end
  end
  
  
  private
  
  def question_params
    params.require(:question).permit(:question, :name, :campaign_id, :campaign_text_status, :campaign_text, :sponsored_text_status, :sponsored_text, :media, :splashimage_opacity , :splashimage, :background_color ,
                                     :bg_img, :background, :splashpage_status, :video , :contact_type_id)
  end
  
end
