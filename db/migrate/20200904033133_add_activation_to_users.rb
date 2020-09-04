class AddActivationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :activation_digest, :string  # 激活摘要
    add_column :users, :activated, :boolean, default: false   #激活状态
    add_column :users, :activated_at, :datetime    # 激活日期
  end
end
