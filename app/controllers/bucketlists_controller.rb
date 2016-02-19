class BucketlistsController < ApplicationController
    before_action :set_bucketlist, only: [:show, :edit, :update]
    before_action :authenticate_user!, except: [:show]

def index
      @bucketlists = Bucketlist.all
    end

    def show
        @photos = @bucketlist.photos
    end
    
    def new 
        @bucketlist = current_user.bucketlists.new
    end 

    def create 
        @bucketlist = current_user.bucketlists.build(bucketlist_params)
        if @bucketlist.save
        redirect_to bucketlists_path
        else 
        render :new
        end 
        end 



    def edit
        if current_user.id != @bucketlist.user.id
            redirect_to root_path, notice: "You don't have permission."
        end 
    end
    
    def update 
    @bucketlist = Bucketlist.find(params[:id])
    
        if @bucketlist.update_attributes(bucketlist_params)
        redirect_to bucketlist_path, notice: "Your to do has been created..."
        else 
        render :edit 
        end 
        end 

    

  def destroy 
      @bucketlist.destroy 
      redirect_to bucketlists_path
    end

    private
    def set_bucketlist
      @bucketlist = Bucketlist.find(params[:id])
    end
    
    def bucketlist_params 
        params.require(:bucketlist).permit(:to_do, :date, :summary)
    end 
    
   
  end 