class Brewery < ActiveRecord::Base
  has_many :beers, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
