module ApplicationHelper
  def gravatar_for(user, options = {size: 80})

    # following codes are from http://en.gravatar.com/site/implement/images/ruby/
    # get the email from URL-parameters or what have you and make lowercase
    # email_address = params[:email].downcase
    email_address = user.email.downcase
 
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)

    size = options[:size]
    # compile URL which can be used in <img src="RIGHT_HERE"...
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    
    # rails provide image_tag() method to help generate html image tag
    # we return image_tag here even though we dont say return in front
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
  end
end
