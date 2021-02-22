class PostsController < ApplicationController

def index
end

def new
@user_post = UserPost.new
end

def create
  user = User.create(user_params)
  Buy.create(buy_params(user))
  StreetAddre.create(street_addre_params(user))
  redirect_to action: :index
  else
    render action: :new
  end
end


end


















end
