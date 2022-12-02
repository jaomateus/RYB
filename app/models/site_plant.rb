class SitePlant < ApplicationRecord
  belongs_to :log
  belongs_to :plant
  belongs_to :site
end
