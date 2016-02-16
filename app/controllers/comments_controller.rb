class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @trip = Trip.find(params[:trip_id])
    @comments = Comment.where(trip_id: params[:trip_id])
    @num_of_comments = @comments.length
    @invitations = Invitation.where(email: session[:user_email])
    @num_of_invites = @invitations.length
  end
 
  # GET /comments/1
  # GET /comments/1.json
  def show
    @trip = Trip.find(params[:trip_id])
    @comment = Comment.find(params[:id])
    @invitations = Invitation.where(email: session[:user_email])
    @num_of_invites = @invitations.length
  end

  # GET /comments/new
  def new
    @trip = Trip.find(params[:trip_id])
    @comment = Comment.new
    @invitations = Invitation.where(email: session[:user_email])
    @num_of_invites = @invitations.length
  end
 
  # GET /comments/1/edit
  def edit
    @trip = Trip.find(params[:trip_id])
    @comment = Comment.find(params[:id])
    @invitations = Invitation.where(email: session[:user_email])
    @num_of_invites = @invitations.length
  end

  # POST /comments
  # POST /comments.json
  def create
    @trip = Trip.find(params[:trip_id])
    @comment = Comment.new(comment_params)
    # binding.pry
    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@trip,@comment], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: [@trip,@comment] }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @trip = Trip.find(params[:trip_id])
    @comment = Comment.find(params[:id])  
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to [@trip,@comment], notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: [@trip,@comment] }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @trip = Trip.find(params[:trip_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to trip_comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      if params[:trip_id]
        @comment = Comment.where(params[:trip_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params['comment']['user_id'] = session[:user_id]
      params['comment']['trip_id'] = params[:trip_id]
      # binding.pry
      params.require(:comment).permit(:comment, :user_id, :trip_id)
    end
end
