class UserWord < ActiveRecord::Base
  belongs_to :user
  belongs_to :word
  
  has_many :user_word_game_levels, dependent: :destroy
  has_many :game_levels, through: :user_word_game_levels

  validates :user, presence: true
  validates :word, presence: true

  def current_game
    game_ids = self.game_levels.pluck(:game_id).uniq

    if game_ids.count == 1
      "one"
    elsif game_ids.count == 2
      "two"
    elsif game_ids.count == 3
      "three"
    else
      nil
    end
  end

  def uwgl_fundamentals
    self.user_word_game_levels.map do |uwgl|
      uwgl if uwgl.game_level.game.name == "Fundamentals"
    end.compact
  end

  def fundamentals_completed?
    num = 0

    self.uwgl_fundamentals.each { |uwgl| num += 1 if uwgl.status == "complete" }

    num == 8
  end

  def fundamentals_in_progress?
    uwgl_fundamentals.map { |uwgl| uwgl.status }.uniq.count == 2
  end

  def fundamentals_not_started?
    num = 0

    uwgl_fundamentals.each { |uwgl| num += 1 if uwgl.status == "not started" }

    num == 8
  end
end
