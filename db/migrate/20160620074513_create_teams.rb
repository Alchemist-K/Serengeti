class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      
      t.string    :name         # 팀 이름
      t.string    :abstract     # 팀 소개(요약)
      t.text      :content      # 팀 소개(자세히)
      t.integer   :number       # 팀 멤버 수
      t.string    :picture      # 팀 그림
      t.integer   :leader       # 팀 리더
      t.text      :tags         # 팀 분류 기준
      t.text      :customTags   # 팀 진짜 태그
      t.string    :file_name, default: ""  # 이미지 업로드
      
      # 삭제 시, 실제로 삭제하는 것이 아닌 숨겨놓기 위한 기능
      t.boolean   :published, default: true
      
      t.timestamps null: false
    end
  end
end
