class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :email
      t.binary :photo

      t.timestamps
    end
  end
end
