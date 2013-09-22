class WelcomeController < ApplicationController
  def index
    @artist_search = Artist.search(params[:q])
    @artists = @artist_search.result.page(params[:page]).per_page(8)

    @sample_search = Sample.search(params[:q])
    @samples = @sample_search.result.page(params[:page]).per_page(8)

    @sample_source_search = SampleSource.search(params[:q])
    @sample_sources = @sample_source_search.result.page(params[:page]).per_page(8)
  end
end
