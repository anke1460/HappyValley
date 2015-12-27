class Article < ActiveRecord::Base
  versioned
  include ShowVersion

  # 调用 Category.versions 显示所有修改的数据内容记录
  # def self.versions
  # end


  # 调用category.revert_to!(2),回滚到某个(2)版本记录的状态
  # def revert_to!(version_id)
  # end

end
