class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      
      t.string    :name         # 팀 이름
      t.string    :abstract     # 팀 소개(요약)
      t.text      :content      # 팀 소개(자세히)
      t.integer   :number       # 팀 멤버 수
      t.string    :picture      # 팀 그림
      
      t.timestamps null: false
    end
  end
end
