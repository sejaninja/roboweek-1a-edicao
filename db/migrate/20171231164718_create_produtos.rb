class CreateProdutos < ActiveRecord::Migration[5.1]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.text :descricao
      t.float :preco
      t.integer :quantidade

      t.timestamps
    end
  end
end
