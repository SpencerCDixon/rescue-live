class AddUserIdColumnToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :user_id, :integer, null: false
  end
end
