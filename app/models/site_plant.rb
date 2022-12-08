class SitePlant < ApplicationRecord
  before_create :set_plant_id
  has_many :logs, dependent: :destroy
  belongs_to :plant
  belongs_to :site
  has_one_attached :photo

  def set_plant_id
  @plant_id = 1
    initials = self.plant.latin_name.split()
    initials = initials[0][0] + initials[1][0] + @plant_id.to_s
    self.identifier = initials

    @plant_id += 1
  end
end
