class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
    	t.integer   :proposer_id
      t.integer   :victim_id
      t.string    :title
      t.string    :description
      t.datetime  :respond_by
      t.datetime  :complete_by
      t.boolean   :accepted
      t.boolean   :completed
      t.string    :proof_video
      t.string    :proof_image

      t.timestamps null: false
    end
  end
end
