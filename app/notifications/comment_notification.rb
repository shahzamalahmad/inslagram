# To deliver this notification:
#
# CommentNotification.with(article: @article).deliver_later(current_user)
# CommentNotification.with(article: @article).deliver(current_user)

class CommentNotification < Noticed::Base
  deliver_by :database
  # deliver_by :action_cable
  # deliver_by :email, mailer: 'CommentMailer', if: :email_notifications?

  # I18n helpers
  def message
    # t(".message")
    @article = Article.find(params[:comment][:article_id])
    @comment = Comment.find(params[:comment][:id])
    @user = User.find(@comment.user_id)
    "#{@user.username} commented on article #{@article.description.truncate(10)}"
  end

  # URL helpers are accessible in notifications
  # Don't forget to set your default_url_options so Rails knows how to generate urls
  def url
    article_path(params[:article])
  end

  def email_notifications?
    !!recipient.preferences[:email]
  end

  after_deliver do
    # Anything you want
  end

  def url
    article_path(Article.find(params[:comment][:article_id]))
  end

  
end
