class CreateTransactionTypes < ActiveRecord::Migration
  def self.up
  	# create TRANSACTION_TYPES table
	  create_table "transaction_types", id: false, force: true do |t|
	  	t.integer "id", null: false
	    t.string "name", limit: 30
	  end
	  execute "ALTER TABLE transaction_types ADD PRIMARY KEY (id);"
  end

  def self.down
  	drop_table :transaction_types
  end
end
