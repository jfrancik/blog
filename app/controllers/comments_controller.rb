class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end
  
  # GET /comments/new
  # GET /comments/new.json
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment])
    @comment.post = @post

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_comment_path(@post, @comment), notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to post_comment_path(@post, @comment), notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_url(@post) }
      format.json { head :no_content }
    end
  end
end
