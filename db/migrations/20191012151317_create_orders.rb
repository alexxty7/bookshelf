Hanami::Model.migration do
  change do
    create_table :orders do
      primary_key :id

      foreign_key :account_id, :accounts, on_delete: :set_null

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
