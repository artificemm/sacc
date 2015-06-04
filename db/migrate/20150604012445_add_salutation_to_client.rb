class AddSalutationToClient < ActiveRecord::Migration
  def change
    add_column :clients, :salutation, :string
    add_column :clients, :profiled, :boolean, default: true
    add_column :clients, :potencial, :boolean, default: true
  end
end
