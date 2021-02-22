class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string  :name,                             null: false
      t.integer :price,                            null: false
      t.text     :informaion,                      null: false
      t.integer  :category_id,                     null: false
      t.integer  :burden_of_shipping_charges_id,   null: false
      t.integer   :shipping_area_id,               null: false
      t.integer   :estimated_shipping_id,          null: false
      t.integer   :product_condition_id,           null: false
      t.references   :user,                        foreign_key: true
      t.timestamps
    end
  end
end
