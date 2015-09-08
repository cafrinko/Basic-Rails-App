class WelcomeController < ApplicationController
  def index #views/welcome/index.html.erb
  	@user = "Mike"
  end

  def about
  end
end
