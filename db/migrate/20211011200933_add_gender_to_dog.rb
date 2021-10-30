class AddGenderToDog < ActiveRecord::Migration[5.1]
  def change
    add_column :dogs, :gender, :string
  end
end
