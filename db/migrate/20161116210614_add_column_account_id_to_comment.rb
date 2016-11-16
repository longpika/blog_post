class AddColumnAccountIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :account_id, :integer
  end
end
