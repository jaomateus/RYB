class SitePlant < ApplicationRecord
  before_create :set_plant_id

  has_many :logs
  belongs_to :plant
  belongs_to :site
  has_one_attached :photo

  private

  def set_plant_id
    self.identifier += 1
  end
end
