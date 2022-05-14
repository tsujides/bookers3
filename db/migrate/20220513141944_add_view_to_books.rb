class AddViewToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :view, :integer
  end
end
