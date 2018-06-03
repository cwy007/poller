class AddVotesCountToVoteOptions < ActiveRecord::Migration[5.1]
  def self.up
    add_column :vote_options, :votes_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :vote_options, :votes_count
  end
end
