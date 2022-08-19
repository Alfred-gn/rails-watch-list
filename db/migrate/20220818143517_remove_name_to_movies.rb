class RemoveNameToMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :list, :name, :string
  end
end
