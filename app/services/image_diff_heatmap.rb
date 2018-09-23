# frozen_string_literal: true

# Outputs diff of 2 images and generates heatmap
class ImageDiffHeatmap
  include Service
  TEMP_FILE_DIR = '/tmp/'
  OUTPUT_FILE_DIR = "#{Rails.root}/public/heatmaps/"

  def initialize(first_image, second_image)
    @first_image = first_image
    @second_image = second_image
    @current_timestamp = Time.now.to_i
  end

  # @return [String] File path of output heatmap png file
  def call
    output_pnm_file = generate_heatmap
    output_png_file = "#{OUTPUT_FILE_DIR}#{@current_timestamp}.png"
    convert_to_png(output_pnm_file, output_png_file)

    output_png_file.gsub(OUTPUT_FILE_DIR, '/heatmaps/')
  end

  private

  def generate_heatmap
    output_pnm_file = "#{TEMP_FILE_DIR}#{@current_timestamp}.pnm"
    system("cd #{ENV['butteraugli_directory']} && "\
           "./butteraugli #{@first_image} #{@second_image} #{output_pnm_file}")
    output_pnm_file
  end

  #we have to convernt pnm to png
  
  def convert_to_png(output_pnm_file, output_png_file)
    system("convert #{output_pnm_file} #{output_png_file}")

    output_png_file
  end
end
