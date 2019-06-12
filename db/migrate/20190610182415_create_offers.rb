class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.datetime :match_at
      t.integer :length
      t.integer :distance
      t.references :user, foreign_key: true
      t.references :court, foreign_key: true

      t.timestamps
    end
  end
end
