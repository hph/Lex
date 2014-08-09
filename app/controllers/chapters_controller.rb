class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all
  end

  def show
    @chapter = Chapter.find(params[:id])
    @laws = @chapter.laws_by_subchapters_and_subsubchapters
  end
end
