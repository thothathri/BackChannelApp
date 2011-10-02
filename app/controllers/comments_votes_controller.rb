class CommentsVotesController < ApplicationController
  # GET /comments_votes
  # GET /comments_votes.json
  def index
    @comments_votes = CommentsVote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments_votes }
    end
  end

  # GET /comments_votes/1
  # GET /comments_votes/1.json
  def show
    @comments_vote = CommentsVote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comments_vote }
    end
  end

  # GET /comments_votes/new
  # GET /comments_votes/new.json
  def new
    @comments_vote = CommentsVote.new
    @comments_vote.comment_id = params[:comment_id]
    @comments_vote.user_id = session[:current_user_id]
    if Comment.find(params[:comment_id]).user_id == session[:current_user_id]
      flash[:notice] = "The user cannot vote his own replies"
      redirect_to :controller => 'posts', :action => 'index' and return
    else
      if CommentsVote.find_by_comment_id_and_user_id(params[:comment_id], session[:current_user_id])
        flash[:notice] = "You have already voted"
        redirect_to :controller => 'posts', :action => 'index' and return
      else

        if @comments_vote.save
          redirect_to :controller => 'posts', :action => 'index'  and return
        else
         flash[:notice] = "Error!"
             redirect_to :controller => 'posts', :action => 'index' and return
        end
        redirect_to :controller => 'posts', :action => 'index'  and return
      end
    end
  end

  # GET /comments_votes/1/edit
  def edit
    @comments_vote = CommentsVote.find(params[:id])
  end

  # POST /comments_votes
  # POST /comments_votes.json
  def create
    @comments_vote = CommentsVote.new(params[:comments_vote])

    respond_to do |format|
      if @comments_vote.save
        format.html { redirect_to @comments_vote, notice: 'Comments vote was successfully created.' }
        format.json { render json: @comments_vote, status: :created, location: @comments_vote }
      else
        format.html { render action: "new" }
        format.json { render json: @comments_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments_votes/1
  # PUT /comments_votes/1.json
  def update
    @comments_vote = CommentsVote.find(params[:id])

    respond_to do |format|
      if @comments_vote.update_attributes(params[:comments_vote])
        format.html { redirect_to @comments_vote, notice: 'Comments vote was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @comments_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments_votes/1
  # DELETE /comments_votes/1.json
  def destroy
    @comments_vote = CommentsVote.find(params[:id])
    @comments_vote.destroy

    respond_to do |format|
      format.html { redirect_to comments_votes_url }
      format.json { head :ok }
    end
  end
end
