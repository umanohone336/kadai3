class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      t.string :title
      t.string :body
      t.integer :user_id
      t.timestamps
    end
  end
end
#   create_table :テーブル名 do |t|
    # t.データ型 :カラム名