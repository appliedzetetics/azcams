class AddSalutationToClients < ActiveRecord::Migration
  def change
    add_column :clients, :salutation, :string
  end
end
