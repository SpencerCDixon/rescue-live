class AddTimestampsColumnToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :created_at, :datetime
    add_column :answers, :updated_at, :datetime
  end
end
