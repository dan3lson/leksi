class AddColumnTimeEndedGameStats < ActiveRecord::Migration
  def change
    add_column :game_stats, :time_ended, :datetime
  end
end
