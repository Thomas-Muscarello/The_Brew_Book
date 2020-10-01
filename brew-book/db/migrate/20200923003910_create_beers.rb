class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :beer_name
      t.string :malt_type
      t.decimal :malt_amount
      t.string :hop
      t.decimal :hop_amount
      t.string :yeast
      t.decimal :yeast_amount
      t.decimal :water_ph
      t.integer :user_id
    end
  end
end
