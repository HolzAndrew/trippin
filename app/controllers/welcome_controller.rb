class WelcomeController < ApplicationController
  def index
    redirect_to users_path
  end
end
