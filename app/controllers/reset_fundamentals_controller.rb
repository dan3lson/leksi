class ResetFundamentalsController < ApplicationController
  def update
    @word_params = Word.find(params[:word_id])
    @word = Rails.env.test? ? @word_params.gsub("=", "") : @word_params
    @user_word = UserWord.find_by(user: current_user, word: @word)

    if @user_word.jeopardy_completed? || @user_word.freestyle_completed?
      render json: {
        errors: "Okay: UW #{@user_word.id}\'s Fundamentals untouched."
      }
    else
      @user_word.uwgl_fundamentals.each do |uwgl|
        uwgl.status = "not started"
        uwgl.save
      end

      @status = @user_word.uwgl_fundamentals.map { |uwgl|
        uwgl.status
      }.uniq

      if @status.first == "not started"
        render json: {
          errors: "Success: UW #{@user_word.id}\'s Funds successfully reset."
        }
      else
        render json: {
          errors: "ERROR: UW #{@user_word.id}\'s Funds NOT reset."
        }
      end
    end
  end
end
