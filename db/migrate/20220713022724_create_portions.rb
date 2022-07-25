class CreatePortions < ActiveRecord::Migration[6.1]
  def change
    create_table :portions do |t|
      t.integer :number
      t.float :value
      t.boolean :status
      t.string :proof
      t.references :contract_historic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
