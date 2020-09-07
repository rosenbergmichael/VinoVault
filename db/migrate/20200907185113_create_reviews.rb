class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :notes
      t.resources :user
      t.resources :wine

      t.timestamps
    end
  end
end
