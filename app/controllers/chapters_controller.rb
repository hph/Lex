class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all
  end

  def show
    @chapter = Chapter.joins(:laws).find(params[:id])
  end
end
