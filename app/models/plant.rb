class Plant < ApplicationRecord
  belongs_to :site
  has_many :plants_log
end
