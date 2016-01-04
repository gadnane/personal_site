class StaticPagesController < ApplicationController
  def home
  	@posts = Post.all.order("created_at desc").last(3)
  	@projects = Project.all.order("created_at desc").last(3)
  end

  def curricVitae
  end
end
