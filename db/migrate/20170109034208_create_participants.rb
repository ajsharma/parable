# frozen_string_literal: true
class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.string :name

      t.timestamps
    end
    add_index :participants, :name
  end
end
