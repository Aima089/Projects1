class AddCompanyIdToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :company, null: true, foreign_key: true
  end
end
