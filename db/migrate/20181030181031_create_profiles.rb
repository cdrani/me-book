class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.text :bio
      t.string :locale
      t.date :birthdate
      t.string :name
      t.string :gender

      t.timestamps
    end
  end
end
