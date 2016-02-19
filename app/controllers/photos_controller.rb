class PhotosController <ApplicationController

    def new
        @bucketlist = Bucketlist.find(params[:bucketlist_id])
        @photo = @bucketlist.photos.new 
    end 
    
    def create
        @bucketlist = Bucketlist.find(params[:bucketlist_id])
        @photo = @bucketlist.photos.build(photo_params)
        if @photo.save
            redirect_to bucketlists_path
        else
            render :new
        end
    end 
	def destroy 
		@photo = photo.find(params[:id])
		bucketlist = @photo.bucketlist

		@photo.destroy
		@photo = Photo.where(bucketlist_id: bucketlist.id)
	end 
    
    private
     def photo_params
        params.require(:photo).permit(:image)
    end
end 
