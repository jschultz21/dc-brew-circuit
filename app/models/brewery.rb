class Brewery < ActiveRecord::Base
  has_many :beers, dependent: :destroy
  geocoded_by :address
  # NHO: could be a great opportunity for a code comment
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
