class PagesController < ApplicationController
  after_action :intercom_shutdown, only: [:home]

  def home
    redirect_to articles_path if logged_in?
  end

  def about
  end

  protected
  def intercom_shutdown
    IntercomRails::ShutdownHelper.intercom_shutdown(session, cookies, request.domain)
  end
end
