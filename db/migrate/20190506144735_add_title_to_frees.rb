class AddTitleToFrees < ActiveRecord::Migration[5.2]
  def change
    add_column :frees, :title, :string
  end
end
