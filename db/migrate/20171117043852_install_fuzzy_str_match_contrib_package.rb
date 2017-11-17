class InstallFuzzyStrMatchContribPackage < ActiveRecord::Migration
  def up
    execute "CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;"
  end

  def down
    execute "DROP EXTENSION IF EXISTS fuzzystrmatch;"
  end
end