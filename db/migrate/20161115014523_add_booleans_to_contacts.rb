class AddBooleansToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :favorite, :boolean
    add_column :contacts, :family, :boolean
    add_column :contacts, :friend, :boolean
    add_column :contacts, :colleague, :boolean
  end
end
