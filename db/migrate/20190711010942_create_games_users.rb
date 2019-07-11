class CreateGamesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :games_users do |t|

      t.timestamps
    end
  end
end
