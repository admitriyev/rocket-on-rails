class MainController < ApplicationController
  def index
  end

  def modal
  end

  # test with curl
  # curl -i -F image=@profile-photo.jpg http://localhost:3000/my_upload_api
  def my_upload_api
  	#debugger
  	uploaded_io = params[:image]
  	
    # writing to a file
    #File.open(Rails.root.join('public', '', uploaded_io.original_filename), 'wb') do |file|
    #	file.write(uploaded_io.read)
  	#end
  	
    # writing to the DB
    new_profile = Profile.new
    new_profile.email = 'test@emai.com'
    new_profile.photo = uploaded_io.read
    #debugger
    new_profile.save

    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  def profile
    @profile = Profile.first
  end

def profile_photo
    @profile = Profile.first
    send_data @profile.photo, :type => 'image/jpg',:disposition => 'inline'
  end

end
