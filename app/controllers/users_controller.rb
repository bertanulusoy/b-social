class UsersController < ApplicationController
 
  #GET /users/new
  def new
    @user = User.new
  end

  #GET /users/1/edit
  def edit   
  end

  #POST /users
  #POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
	format.json { render action: 'show', status: :created, location: @user }
      end
  end


end
