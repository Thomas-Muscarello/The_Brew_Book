class Beer < ActiveRecord::Base
belongs_to :user
    validates :beer_name, :malt_type, :hop, :yeast, :water_ph, presence: :true
end