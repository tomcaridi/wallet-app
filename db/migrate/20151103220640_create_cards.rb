class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :card_number
      t.string :card_type
      t.integer :exp_month
      t.integer :exp_year
      t.decimal :balance

      t.timestamps null: false
    end
  end
end
