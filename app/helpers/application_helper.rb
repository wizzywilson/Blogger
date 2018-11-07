module ApplicationHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://www.gravatar.com/avatar/#{gravatar_id}?s=150"
    image_tag(gravatar_url, class: "img-circle")
  end
end
