class AddSeedIdToLinks < ActiveRecord::Migration
  def change
    add_column :links, :seed_id, :integer
  end
end
