class AddSubsubchapterToLaws < ActiveRecord::Migration
  def change
    add_column :laws, :subsubchapter, :string
  end
end
