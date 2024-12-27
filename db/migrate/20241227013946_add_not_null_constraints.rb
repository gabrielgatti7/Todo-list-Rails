class AddNotNullConstraints < ActiveRecord::Migration[8.0]
  def change
    change_column_null :lists, :name, false
    change_column_null :tasks, :name, false
  end
end
