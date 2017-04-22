class GameStat < ActiveRecord::Base
  belongs_to :user_word
  belongs_to :game
  has_one :game_stat_example_non_example, dependent: :destroy
  has_one :game_stat_meaning_alt, dependent: :destroy
  has_one :game_stat_freestyle_sent_stem, dependent: :destroy
  has_one :game_stat_freestyle_rel_word, dependent: :destroy
  has_one :game_stat_freestyle_lek_tale, dependent: :destroy

  validates :user_word, presence: true
  validates :game, presence: true

  def self.universal(user_word, game, time_started, time_ended)
    GameStat.new(
      user_word: user_word,
      game: game,
      time_started: time_started,
      time_ended: time_ended
    )
  end

  def self.freestyles
    where(game: [12, 13, 14, 15, 16])
  end
end
