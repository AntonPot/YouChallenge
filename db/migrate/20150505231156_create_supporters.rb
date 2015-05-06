class CreateSupporters < ActiveRecord::Migration
  def change
    create_table :supporters do |t|
      t.integer :challenge_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
