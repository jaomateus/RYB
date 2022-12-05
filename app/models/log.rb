class Log < ApplicationRecord
  belongs_to :site
  belongs_to :site_plant, optional: true
  has_many :plants, through: :site_plant
  has_many_attached :photos
end
