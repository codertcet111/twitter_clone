module CommentsHelper
  def date(comment)
    comment.created_at.strftime('%d %h, %Y')
  end
end
