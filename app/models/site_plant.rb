class SitePlant < ApplicationRecord
  before_create :set_plant_id
  has_many :logs, dependent: :destroy
  belongs_to :plant
  belongs_to :site
  has_one_attached :photo

  def set_plant_id
    if SitePlant.count > 0
      if SitePlant.last.identifier
        plant_id = SitePlant.last.identifier + 1
      else
        plant_id = 1
      end
    else
      plant_id = 1
    end

    initials = self.plant.latin_name.split()
    initials = initials[0][0] + initials[1][0]
    self.identifier = plant_id
    self.plant_tag = initials
  end
end
