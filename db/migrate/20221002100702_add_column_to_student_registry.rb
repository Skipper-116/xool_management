class AddColumnToStudentRegistry < ActiveRecord::Migration[7.0]
  def change
    add_column :student_registries, :obs_datetime, :datetime
  end
end
