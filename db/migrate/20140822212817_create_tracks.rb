class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :spotify_id
      t.integer :min_anger
      t.integer :max_anger
    end
  end
end
