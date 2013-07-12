class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :player1
      t.references :player2
      t.references :winner
      t.string :last_move
    end
  end
end
