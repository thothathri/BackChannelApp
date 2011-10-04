class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

def login
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts params[:username]
    puts params[:password]

    @user = User.find_by_username(params[:username])
    if(@user==nil)
       redirect_to(:controller => 'main',:action => 'index') and return
    end
    if(@user.password!=params[:password])
      redirect_to(:controller => 'main',:action => 'index', notice: 'Wrong User Name!') and return
    end
    session[:current_user_id] = @user.id
    puts session[:current_user_id]
    puts session[:current_user_id]
    puts session[:current_user_id]
    puts session[:current_user_id]
    if User.find(session[:current_user_id]).role == 'admin'
       redirect_to(:controller => 'users',:action => 'admin_user', :notice => session[:current_user_id] ) and return
    end
    redirect_to(:controller => 'posts',:action => 'index', :notice => session[:current_user_id] ) and return
end

  def admin_user

  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by_username(params[:search_by_user_query])
    if @user == nil
      redirect_to :controller => 'users', :action => 'user_not_found' and return
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def user_not_found

  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
  def log

     respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])


      if @user.save
        redirect_to(:controller => 'users', :action => 'log')
      else
        redirect_to(:controller => 'main', :action => 'index')
      end
  end

  def search
    @user = User.find_by_username(params[:search_by_user_query])
    if @user == nil
          redirect_to(:controller => 'users',:action => 'user_not_found', notice: 'No such user exists' ) and return
    end
      @user_posts = Post.find_all_by_user_id(@user.id)
    respond_to do |format|
      format.html # search.html.erb
    end
  end

  def search_by_content
    @user_posts =Post.find(:all, :conditions => "topic LIKE '%#{params[:search_by_content_query]}%'")
    if @user_posts.count == 0
      redirect_to(:controller => 'users', :action => 'content_not_found', notice: 'No such content found!') and return
    end
  end


  def content_not_found

  end
  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end

  def logout
  session[:current_user_id]=nil
  redirect_to '/main/index'
end
end
