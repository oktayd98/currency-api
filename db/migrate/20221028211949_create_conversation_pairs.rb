class CreateConversationPairs < ActiveRecord::Migration[7.0]
  def change
    create_table :conversation_pairs do |t|
      t.references :base, null: false
      t.references :target, null: false
      t.decimal :rate

      t.timestamps
    end

    add_foreign_key :conversation_pairs, :currencies, column: :base_id
    add_foreign_key :conversation_pairs, :currencies, column: :target_id
  end
end
