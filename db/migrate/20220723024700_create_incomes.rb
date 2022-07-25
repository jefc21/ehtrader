class CreateIncomes < ActiveRecord::Migration[6.1]
  def change
    create_table :incomes do |t|
      t.date :reference_date
      t.string :income_doc

      t.timestamps
    end
  end
end
