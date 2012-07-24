class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|
      t.integer :amount_cents
      t.string :link

      t.timestamps
    end
  end
end
