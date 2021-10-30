class AddMetaToBlogposts < ActiveRecord::Migration[5.1]
  def change
    add_column :blogposts, :meta, :string
  end
end
