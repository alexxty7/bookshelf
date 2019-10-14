Hanami::Model.migration do
  change do
    create_table :products do
      primary_key :id

      column :name, String
      column :description, String
      column :price, Float

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
