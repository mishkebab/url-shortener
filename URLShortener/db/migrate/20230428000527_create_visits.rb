class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.integer "user_id", null: false 
      t.integer "shortened_url_id", null: false
      t.timestamps
    end
  end
end
