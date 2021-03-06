class Project < ActiveRecord::Base
  attr_accessible :description, :title, :team_id

  belongs_to :team
  has_many :items

  validates :title, :description, :team_id, :presence => true
end
