class ApplicationController < ActionController::Base
  def index
	render json: { data: 'test' }
  end
end
