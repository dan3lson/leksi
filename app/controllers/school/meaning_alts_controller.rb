class School::MeaningAltsController < BaseSchoolController
  def index
    @meaning_alts = current_user.meaning_alts.show(:updated_at, :desc)
  end

  def new
    @m_a = MeaningAlt.new
  end

  def create
    @m_a = MeaningAlt.new(meaning_alt_params)
    @word = Word.find(params[:word_id])
    @m_a.word = @word
    @m_a.creator = current_user
    @created = false

    if @m_a.save
      @created = true
    else
      @created = false
    end

    respond_to do |format|
      format.js
    end
  end

  def edit
    @m_a = MeaningAlt.find(params[:id])
    @word = @m_a.word
  end

  def update
    @m_a = MeaningAlt.find(params[:id])

    if @m_a.update(meaning_alt_params)
      flash[:success] = "You successfully updated content for this word."
      redirect_to school_meaning_alts_path
    else
      flash[:danger] = "Sorry, updating that didn\'t work. Please try again."
      render :edit
    end
  end

  def destroy
    @m_a = MeaningAlt.find(params[:id])
    @word = Word.find(params[:word_id])

    if @m_a.destroy
      flash[:success] = "You successfully deleted content for #{@word.name}."
      redirect_to school_meaning_alts_path
    else
      flash[:danger] = "Sorry, deleting that didn\'t work. Please try again."
      render :edit
    end
  end

  def fourth_grade
    @meaning_alt = MeaningAlt.new
    @fourth_grade_words = Word.fourth_grade
  end

  private

  def meaning_alt_params
    params.require(:meaning_alt).permit(
      :text,
      :choices,
      :answer,
      :feedback
    )
  end
end
