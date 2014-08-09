class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all
  end

  def show
    @chapter = Chapter.find(params[:id])
    @laws = @chapter.laws.group_by(&:subchapter)
  end
end
