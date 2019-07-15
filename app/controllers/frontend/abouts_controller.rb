class Frontend::AboutsController < ApplicationController
  before_action :set_about, only: [:show, :edit, :update, :destroy]

  def show
  end

  def meet
    @team = TeamMember.all.order(:order)
  end

  def faq
  end

  private
    def set_about
      @about = About.find(params[:id])
    end
end
