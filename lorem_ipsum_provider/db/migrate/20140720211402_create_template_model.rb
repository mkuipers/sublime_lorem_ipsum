class CreateTemplateModel < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.text "filler_text"
      t.string "name", null: false
    end
  end
end
