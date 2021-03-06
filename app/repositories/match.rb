require "active_repository"
require "./app/repositories/base_repository"
require "./app/repositories/group"
require "./app/repositories/team"
require "./app/models/match_model"
require "./app/documents/match_document"

class Match < BaseRepository
  fields :group_id, :home_team_id, :away_team_id, :home_team_score, :away_team_score, :created_at, :updated_at

  belongs_to :group
  belongs_to :home_team, :class_name => Team
  belongs_to :away_team, :class_name => Team

  has_many :bets

  def self.add(championship_id, name)
    Group.where(:championship_id => championship_id, :name => name).first_or_create
  end
end