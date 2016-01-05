class StaticPagesController < ApplicationController
  def home
  	@posts = Post.all.order("created_at desc").last(3)
  	@projects = Project.all.order("created_at desc").last(2)
  end

  def curricVitae
   send_file(
    "#{Rails.root.join('public','res_site.pdf')}",
    filename: "res_site.pdf",
    type: "application/pdf",
    disposition: "inline"
  )
  end

end
