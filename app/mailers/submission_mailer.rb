class SubmissionMailer < ApplicationMailer
  default from: "notification@webbit.com"

  def new_response
    @comment = params[:comment]
    @submission = params[:submission]


    mail to: @submission.user.email, subject: "New response on #{@submission.title}"
  end
end
