class Item < ActiveRecord::Base
  belongs_to :project
  attr_accessible :completed, :description, :title, :project_id

  validates :completed, :title, :description, :project_id, :presence => true
end
