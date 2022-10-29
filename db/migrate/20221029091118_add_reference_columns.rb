# frozen_string_literal: true

# Add reference columns to the database
class AddReferenceColumns < ActiveRecord::Migration[7.0]
  def change
    # loop through all tables in the database
    ActiveRecord::Base.connection.tables.each do |table_name|
      # skip the schema_migrations table
      next if table_name == 'schema_migrations'
      next if table_name == 'ar_internal_metadata'
      next if table_name == 'schema_info'

      puts "Adding reference columns to #{table_name}"
      add_changed_by_column(table_name)
      add_reference_to_person(table_name)
    end
  end

  def down
    # loop through all tables in the database
    ActiveRecord::Base.connection.tables.each do |table_name|
      # skip the schema_migrations table
      next if table_name == 'schema_migrations'

      remove_changed_by_column(table_name)
    end
  end

  private

  def add_changed_by_column(table_name)
    add_column table_name, :creator, :bigint, null: false, default: 1
    add_column table_name, :changed_by, :bigint, null: true, default: nil
    add_column table_name, :voided_by, :bigint, null: true, default: nil
  end

  def add_reference_to_person(table_name)
    add_foreign_key table_name, :people, column: :creator, primary_key: :id, index: true
    add_foreign_key table_name, :people, column: :changed_by, primary_key: :id, index: true
    add_foreign_key table_name, :people, column: :voided_by, primary_key: :id, index: true
  end

  def remove_changed_by_column(table_name)
    remove_column table_name, :creator
    remove_column table_name, :changed_by
    remove_column table_name, :voided_by
  end
end
