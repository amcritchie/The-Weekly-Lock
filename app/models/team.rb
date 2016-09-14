class Team < ActiveRecord::Base
  has_many :games
  has_many :performances

  mount_uploader :logo, LogoUploader

  def record(week)

  end
end
