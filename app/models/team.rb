class Team < ActiveRecord::Base
  has_many :games
  mount_uploader :logo, LogoUploader
end
