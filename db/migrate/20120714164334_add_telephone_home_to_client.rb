class AddTelephoneHomeToClient < ActiveRecord::Migration
  def change
    add_column :clients, :telephone_home, :string
  end
end
