class ApplicationController < ActionController::API

  def home
    render 'public/index.html.erb'
  end
end
