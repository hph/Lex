class LawsController < ApplicationController
  def index
    @laws = Law.all
  end

  def show
    render text: Law.find(params[:id]).raw_html
  end
end
