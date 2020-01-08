class SongsController < ApplicationController
    
    def new
        @song = Song.new
      end

    def create
        @song = Song.new(song_params)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def edit
        @song = Song.find(params[:id])  
    end

    def update
        @song = Song.find_by(id: params[:id])
        @song.assign_attributes(song_params)
        if @song.valid? == true
          @song.save
          redirect_to song_path(@song)
        else
          render :edit
        end 
    end

    def destroy
    end

    def index
        @songs = Song.all 
    end

    def show
        @song = Song.find(params[:id])
    end

    private

    def song_params(*args)
        params.require(:song).permit(*args)
      
    end
end
