class ChangeCompleteTimeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :todos, :complete_time, :completed_time
  end
end
