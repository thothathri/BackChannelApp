class PostsVotesController < ApplicationController
  # GET /posts_votes
  # GET /posts_votes.json
  def index
    @posts_votes = PostsVote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts_votes }
    end
  end

  # GET /posts_votes/1
  # GET /posts_votes/1.json
  def show
    @posts_vote = PostsVote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @posts_vote }
    end
  end

  # GET /posts_votes/new
  # GET /posts_votes/new.json
  def new
    @posts_vote = PostsVote.new
    @posts_vote.post_id = params[:post_id]
    @posts_vote.user_id = session[:current_user_id]
    if Post.find(params[:post_id]).user_id == session[:current_user_id]
      flash[:notice] = "The user cannot vote his own posts/replies"
      redirect_to :controller => 'posts', :action => 'index' and return
    else
      if PostsVote.find_by_post_id_and_user_id(params[:post_id], session[:current_user_id])
        flash[:notice] = "You have already voted"
        redirect_to :controller => 'posts', :action => 'index' and return
      else
        if @posts_vote.save
          @post = Post.find(params[:post_id])
          @post.count = @post.count+1
          @post.save
          redirect_to :controller => 'posts', :action => 'index'  and return
        else
         flash[:notice] = "Error!"
             redirect_to :controller => 'posts', :action => 'index' and return
        end
        redirect_to :controller => 'posts', :action => 'index'  and return
      end
    end
  end

  # GET /posts_votes/1/edit
  def edit
    @posts_vote = PostsVote.find(params[:id])
  end

  # POST /posts_votes
  # POST /posts_votes.json
  def create

  end


  # PUT /posts_votes/1
  # PUT /posts_votes/1.json
  def update
    @posts_vote = PostsVote.find(params[:id])

    respond_to do |format|
      if @posts_vote.update_attributes(params[:posts_vote])
        format.html { redirect_to @posts_vote, notice: 'Posts vote was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @posts_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts_votes/1
  # DELETE /posts_votes/1.json
  def destroy
    @posts_vote = PostsVote.find(params[:id])
    @posts_vote.destroy

    respond_to do |format|
      format.html { redirect_to posts_votes_url }
      format.json { head :ok }
    end
  end
end
