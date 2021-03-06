# rubocop: disable Layout/LineLength
# rubocop: disable Style/GuardClause

module ApplicationHelper
  def home_btn
    link_to('<i class="fab fa-twitter fa-2x"></i>'.html_safe, root_path, class: 'text-white px-3 pt-1')
  end

  def users_btn
    link_to('<i class="fas fa-users fa-2x"></i>'.html_safe, users_path, class: 'text-white px-3 pt-1')
  end

  def profile_btn
    link_to('<i class="fas fa-user-circle fa-2x"></i>'.html_safe, user_path(current_user), class: 'text-white px-3 pt-1') if current_user
  end

  def nav_btns
    if current_user
      link_to('Log out', logout_path, class: 'text-dark text-decoration-none btn btn-light')
    else
      link_to('Sign in', login_path, class: 'text-dark text-decoration-none btn btn-light mr-3') + link_to('Sign up', new_user_path, class: 'text-dark text-decoration-none btn btn-light')
    end
  end

  def profile_box
    render 'tweets/profile' if current_user
  end

  def check_main(tweet)
    like_or_dislike(tweet) if current_user
  end

  def like_or_dislike(tweet)
    like = Like.find_by(tweet: tweet, user: current_user)
    if like && like.is_active
      link_to('<i class="far fa-thumbs-down"></i>'.html_safe, "javascript:void(0);", class: 'dislike_cliked', :"data-tweet" => "#{tweet.id}", :"data-like" => "#{like.id}")
    else
      link_to('<i class="fas fa-thumbs-up"></i>'.html_safe, "javascript:void(0);", class: 'like_cliked', :"data-tweet" => "#{tweet.id}")
    end
  end

  def flash_notice
    if flash[:notice]
      raw("<div class='not notification is-primary global-notification float-right w-100'>
        <p class='notice'>#{notice}</p>
      </div>")
    end
  end

  def flash_alert
    if flash[:alert]
      raw("<div class='not notification is-danger global-notification float-right w-100'>
        <p class='alert'>#{alert}</p>
      </div>")
    end
  end
end

# rubocop: enable Layout/LineLength
# rubocop: enable Style/GuardClause
