class UsersController < ApplicationController

  before_filter :require_admin

  def index
    @users = User.account(current_user).paginate :page => params[:page], :per_page => 16

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    if (@user.account_id == current_user.account.id)
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @user }
      end
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @user.account_id == current_user.account

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.account_id = current_user.account

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice => 'user was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?

    respond_to do |format|
      # Only allow this update if the current user is an admin, or has the same ID as the user being modified
      if current_user.admin? || @user.account_id == current_user.account.id
        if @user.update_attributes(params[:user])
          format.html { redirect_to @user, :notice => "user was successfully updated."}
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @user.errors, :status => :unprocessable_entity }
        end
      else
        format.html { redirect_to @user, :alert => "Internal security violation: user/owner accounts differ (#{@user.account_id}/#{current_user.account.id})" }
        format.json { head :no_content }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    if @user.account_id == current_user.account.id
      @user.destroy

      respond_to do |format|
        format.html { redirect_to users_url }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to users_url, :alert => "Internal security violation: user/owner accounts differ (#{@user.account_id}/#{current_user.account.id})" }
        format.json { head :no_content }
      end
    end
  end

  private

    def require_admin
      unless user_signed_in? && current_user.admin?
        flash[:error] = "Operation not permitted for non-administrative user"
        redirect_to '/status'
      end
    end
end
