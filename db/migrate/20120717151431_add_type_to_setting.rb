class AddTypeToSetting < ActiveRecord::Migration
  def change
    add_column :settings, :valuetype, :string
  end
end
