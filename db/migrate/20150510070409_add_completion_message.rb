class AddCompletionMessage < ActiveRecord::Migration
  def change
  	add_column :comments, :completionmsg, :boolean
  	add_column :comments, :imagelink, :string
  	add_column :comments, :videolink, :string
  end
end
