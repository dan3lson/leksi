class UserWord < ActiveRecord::Base
  belongs_to :user
  belongs_to :word
  has_many :user_word_game_levels, dependent: :destroy
  has_many :game_levels, through: :user_word_game_levels
  has_many :game_stats, dependent: :destroy

  validates :user, presence: true
  validates :word, presence: true

  def current_game
    game_ids = game_levels.pluck(:game_id).uniq

    if freestyle_completed?
      "all-games-completed"
    elsif game_ids.count == 1
      "one"
    elsif game_ids.count == 2
      "two"
    elsif game_ids.count == 3
      "three"
    else
      nil
    end
  end

  def uwgls
    UserWordGameLevel.where(user_word: self).order(:game_level_id)
  end

  def uwgl_fundamentals
    uwgls.take(8)
  end

  def uwgl_jeopardys
    uwgls.drop(8).take(20)
  end

  def uwgl_freestyles
    uwgls.drop(28)
  end

  def fundamental_statuses
    num_not_started = 0
    num_in_progress = 0
    num_complete = 0

    uwgl_fundamentals.each do |uwgl|
      if uwgl.status == "not started"
        num_not_started += 1
      elsif uwgl.status == "in progress"
        num_in_progress += 1
      elsif uwgl.status == "complete"
        num_complete += 1
      end
    end

    [num_not_started, num_in_progress, num_complete]
  end

  def fundamental_not_started?
    num = 0

    uwgl_fundamentals.each { |uwgl| num += 1 if uwgl.status == "not started" }

    num == 8
  end

  def fundamental_completed?
    num = 0

    uwgl_fundamentals.each { |uwgl| num += 1 if uwgl.status == "complete" }

    num == 8
  end

  def jeopardy_not_started?
    num = 0

    uwgl_jeopardys.each { |uwgl| num += 1 if uwgl.status == "not started" }

    num == 20
  end

  def jeopardy_completed?
    num = 0

    uwgl_jeopardys.each { |uwgl| num += 1 if uwgl.status == "complete" }

    num == 20
  end

  def freestyle_not_started?
    num = 0

    uwgl_freestyles.each { |uwgl| num += 1 if uwgl.status == "not started" }

    num == 12
  end

  def freestyle_completed?
    num = 0

    uwgl_freestyles.each { |uwgl| num += 1 if uwgl.status == "complete" }

    num == 12
  end

  def self.destroy_jeopardys_for(user_word)
    user_word.uwgl_jeopardys.each { |uwgl| uwgl.destroy }
  end

  def fundamental_completed_last_day?
    first_uwgl_fundamental = self.uwgl_fundamentals.first

    first_uwgl_fundamental.updated_at >= 1.days.ago &&
    (first_uwgl_fundamental.created_at != first_uwgl_fundamental.updated_at)
  end

  def jeopardy_completed_last_day?
    first_uwgl_jeopardy = self.uwgl_jeopardys.first

    first_uwgl_jeopardy.updated_at >= 1.days.ago &&
    (first_uwgl_jeopardy.created_at != first_uwgl_jeopardy.updated_at)
  end

  def freestyle_completed_last_day?
    first_uwgl_freestyle = self.uwgl_freestyles.first

    first_uwgl_freestyle.updated_at >= 1.days.ago &&
    (first_uwgl_freestyle.created_at != first_uwgl_freestyle.updated_at)
  end
end
