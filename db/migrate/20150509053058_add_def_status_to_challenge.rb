class AddDefStatusToChallenge < ActiveRecord::Migration
  def change
  	change_column_default :challenges, :status, "not accepted"
  end
end
