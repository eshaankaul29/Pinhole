# frozen_string_literal: true

class AuglisController < ApplicationController
  before_action :set_image_paths, only: :create

  def new; end
 
  def create
    heatmap_file = ImageDiffHeatmap.call(@first_image, @second_image) #service:ImageDiffHeatmap two files and returns heatmap in png
    redirect_to action: :show_image, output_image: heatmap_file
  end

  def show_image
    @output_image = params[:output_image]
    render 'show'
  end

  private

  def set_image_paths
    @first_image = params[:image_1].path
    @second_image = params[:image_2].path
  end
end
