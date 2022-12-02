class Site < ApplicationRecord
  belongs_to :user
  has_many :logs
  has_many :plants_logs, through: :logs
  has_many :site_plants
  has_many :plants, through: :site_plants
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
