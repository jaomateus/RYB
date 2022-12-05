class SitePlant < ApplicationRecord
  has_many :logs
  belongs_to :plant
  belongs_to :site
end
