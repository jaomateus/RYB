class PlantsLog < ApplicationRecord
  belongs_to :log
  belongs_to :plant
end
