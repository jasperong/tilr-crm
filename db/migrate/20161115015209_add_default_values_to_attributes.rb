class AddDefaultValuesToAttributes < ActiveRecord::Migration[5.0]
  def up
    change_column :contacts, :favorite, :boolean, default: false
    change_column :contacts, :family, :boolean, default: false
    change_column :contacts, :friend, :boolean, default: false
    change_column :contacts, :colleague, :boolean, default: false
  end
end
