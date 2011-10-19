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
    @user = User.find_by_username(params[:username])
    if(@user==nil)
       flash[:notice] = 'No such Username Found!'
       redirect_to(:controller => 'main',:action => 'index') and return
    end
    if(@user.password!=User.create_encrypted_password(params[:password]))
      flash[:notice] = 'Incorrect Password For User!!'
      redirect_to(:controller => 'main',:action => 'index') and return
    end
    session[:current_user_id] = @user.id
    if User.find(session[:current_user_id]).role == 'admin'
       flash[:notice] = ''
       redirect_to(:controller => 'users',:action => 'admin_user' ) and return
    end
    flash[:notice] = ''
    redirect_to(:controller => 'posts',:action => 'index' ) and return
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
    @user = User.new
    @user.username = params[:username]
    @user.name = params[:name]
    @user.email = params[:email]
    @user.phone = params[:phone]
    @user.role = params[:role]
    password = params[:password]
    @user.password= User.create_encrypted_password(password)
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
    if @user_posts ==nil
      redirect_to(:controller => 'users', :action => 'content_not_found', notice: 'No such content found!') and return
    end
  end

def users_details
    @users = User.find(:all)
    @count = 0
    @usersarray = []
    @votesarray = []
    @postsarray = []
    @commentsarray = []
@users.each do |user|
    @count = 0
    @usersarray.push(user.username)
  if Post.find_all_by_user_id(user.id).size != 0
    @post = Post.find_all_by_user_id(user.id)
    @post.each do |post|
      if PostsVote.find_all_by_post_id(post.id).size!=0
        @count+=PostsVote.find_all_by_post_id(post.id).size
      end
    end
    @votesarray.push(@count)
    @postsarray.push(Post.find_all_by_user_id(user.id).size)
  else
    @votesarray.push(0)
    @postsarray.push(0)
  end
  if Comment.find_all_by_user_id(user.id)!=nil
    @commentsarray.push(Comment.find_all_by_user_id(user.id).size)
  else
    @commentsarray.push(0)
  end
end
  @length = @usersarray.size
end


  def content_not_found

  end
  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to :controller => 'users', :action => 'admin_user'
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    User.cascade_delete(@user)

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
