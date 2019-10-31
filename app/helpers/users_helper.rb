module UsersHelper
    def avatar_url(user)
        gravatar_id = Digest::MD5::hexdigest(user.email).downcase
        "http://www.gravatar.com/avatar/#{gravatar_id}?size=250"
    end
end
