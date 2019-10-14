Hanami::Model.migration do
  change do
    alter_table :orders do
      add_column :total_price, Float
    end
  end
end
