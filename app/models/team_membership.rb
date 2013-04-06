class TeamMembership < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
  # attr_accessible :title, :body
  validate :team, :user, :presence => true
end
