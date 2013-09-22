class SampleSourcesController < ApplicationController
  # GET /sample_sources
  # GET /sample_sources.json
  def index
#    @sample_sources = SampleSource.all
    # Ransack:
    @search = SampleSource.search(params[:q])
    @sample_sources = @search.result(distinct: true).page(params[:page]).per_page(8)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sample_sources }
    end
  end
=begin
  # GET /sample_sources/1
  # GET /sample_sources/1.json
  def show
    @sample_source = SampleSource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sample_source }
    end
  end

  # GET /sample_sources/new
  # GET /sample_sources/new.json
  def new
    @sample_source = SampleSource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sample_source }
    end
  end

  # GET /sample_sources/1/edit
  def edit
    @sample_source = SampleSource.find(params[:id])
  end

  # POST /sample_sources
  # POST /sample_sources.json
  def create
    @sample_source = SampleSource.new(params[:sample_source])

    respond_to do |format|
      if @sample_source.save
        format.html { redirect_to @sample_source, notice: 'Sample source was successfully created.' }
        format.json { render json: @sample_source, status: :created, location: @sample_source }
      else
        format.html { render action: "new" }
        format.json { render json: @sample_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sample_sources/1
  # PUT /sample_sources/1.json
  def update
    @sample_source = SampleSource.find(params[:id])

    respond_to do |format|
      if @sample_source.update_attributes(params[:sample_source])
        format.html { redirect_to @sample_source, notice: 'Sample source was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sample_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sample_sources/1
  # DELETE /sample_sources/1.json
  def destroy
    @sample_source = SampleSource.find(params[:id])
    @sample_source.destroy

    respond_to do |format|
      format.html { redirect_to sample_sources_url }
      format.json { head :no_content }
    end
  end
=end
end
