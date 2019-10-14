Hanami::Model.migration do
  change do
    create_table :order_products do
      primary_key [:order_id, :product_id]

      foreign_key :order_id, :orders, on_delete: :set_null
      foreign_key :product_id, :products, on_delete: :set_null

      column :quantity, Integer
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
