class AddCpfToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :cpf, :string
  end
end
