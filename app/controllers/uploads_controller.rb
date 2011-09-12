class UploadsController < ApplicationController
  def create
    @upload = Upload.new(params[:upload])
    if @upload.save
      render :json => {:pic_path => @upload.picture.url.to_s, :name => @upload.picture.instance.attributes["picture_file_name"]}, :content_type => 'text/html'
    else
      render :json => {:result => 'error'}, :content_type => 'text/html'
    end
  end
end
