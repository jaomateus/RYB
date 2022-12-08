class SitePlant < ApplicationRecord
  # before_create :set_plant_id
  # plant_id = 1

  has_many :logs
  belongs_to :plant
  belongs_to :site
  has_one_attached :photo

  # def set_plant_id
  #   self.identifier =
  # end

  # before_create do
  #   self.name = login.capitalize if name.blank?
  # end
end
