class CreateJoinTableRoomTheme < ActiveRecord::Migration[5.0]
  def change
    create_join_table :rooms, :themes do |t|
       t.index [:room_id, :theme_id]
       t.index [:theme_id, :room_id]
    end
  end
end
