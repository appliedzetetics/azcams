class ApplicationController < ActionController::Base
 	before_filter :authenticate_user!

  protect_from_forgery

  helper_method :printqueue

  def printqueue
    p = PrintQueue.where(:medium => 'Letter')
  end

end
