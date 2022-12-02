class Log < ApplicationRecord
  belongs_to :site
  has_many :plant_logs
  has_one_attached :photo
end
