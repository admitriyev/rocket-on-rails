class MainController < ApplicationController
  def index
  end

  def modal
  end

  def my_upload_api
  	#debugger
  	uploaded_io = params[:image]
  	File.open(Rails.root.join('public', '', uploaded_io.original_filename), 'wb') do |file|
    	file.write(uploaded_io.read)
  	end
  	render :nothing => true, :status => 200, :content_type => 'text/html'
  end

end
