class Brewery < ActiveRecord::Base
  has_many :beers, dependent: :destroy
  geocoded_by :address
  validates_presence_of :address
  after_validation :geocode
  # after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

end
