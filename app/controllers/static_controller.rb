class StaticController < ApplicationController
  before_filter :authenticate_user!, :except => [:welcome]


  def welcome
#    AZCAMS = '<font color=#0000ff>a</font>|<font color=#ffffff>z</font>cams'.html_safe
    @page_no = params[:page_no].to_i || 0

  end

  def status

  end
end
