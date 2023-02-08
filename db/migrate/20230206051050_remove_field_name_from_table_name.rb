class RemoveFieldNameFromTableName < ActiveRecord::Migration[7.0]
  def change
    remove_column :authors, :author_id, :string
  end
end
