class Site < ApplicationRecord
  belongs_to :site
  has_many :plants
  has_many :logs
  has_many :plants_logs, through: :logs
end
