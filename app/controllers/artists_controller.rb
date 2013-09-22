class ArtistsController < ApplicationController
  # GET /artists
  # GET /artists.json
  def index
    #@artists = Artist.all
    #@artists = Artist.search(params[:search])
    # Ransack:
    @search = Artist.search(params[:q])
    @artists = @search.result(distinct: true).page(params[:page]).per_page(8)

=begin
    # Pagination with Kaminari:
    #@artists = Artist.page(params[:page]).per(10)
    # will_paginate:
    @artists = Artist.page(params[:page]).per_page(10)
=end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artists }
    end
  end

=begin
  # GET /artists/1
  # GET /artists/1.json
  def show
    @artist = Artist.find(params[:id])

    #@artists = Artist.paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artist }
    end
  end

  # GET /artists/new
  # GET /artists/new.json
  def new
    @artist = Artist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @artist }
    end
  end

  # GET /artists/1/edit
  def edit
    @artist = Artist.find(params[:id])
  end

  # POST /artists
  # POST /artists.json
  def create
    @artist = Artist.new(params[:artist])

    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
        format.json { render json: @artist, status: :created, location: @artist }
      else
        format.html { render action: "new" }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /artists/1
  # PUT /artists/1.json
  def update
    @artist = Artist.find(params[:id])

    respond_to do |format|
      if @artist.update_attributes(params[:artist])
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    respond_to do |format|
      format.html { redirect_to artists_url }
      format.json { head :no_content }
    end
  end
=end
end
