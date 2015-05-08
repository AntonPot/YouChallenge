class SetDefaultToChallenge < ActiveRecord::Migration
  def change
  	change_column_default :challenges, :accepted, false
  	change_column_default :challenges, :completed, false
  end
end
