class AddTelephoneMobileToClient < ActiveRecord::Migration
  def change
    add_column :clients, :telephone_mobile, :string
  end
end
