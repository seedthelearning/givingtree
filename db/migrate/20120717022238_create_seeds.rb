class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|
      t.integer :amount_cents

      t.timestamps
    end
  end
end
