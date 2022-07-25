class CreateContractHistorics < ActiveRecord::Migration[6.1]
  def change
    create_table :contract_historics do |t|
      t.float :value
      t.integer :num_portion
      t.boolean :status
      t.date :open_date
      t.references :contract, null: false, foreign_key: true

      t.timestamps
    end
  end
end
