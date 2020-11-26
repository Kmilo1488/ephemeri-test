class EphemerisController < ApplicationController

  def index
    binding.pry
    search = params['search']
    @ephemeris = search.present? ? Ephemeri.by_name(search['name']) : Ephemeri.all
  end

  def new
    @ephemeri = Ephemeri.new
  end

  def create
    @ephemeri = Ephemeri.new(ephemeri_params)
    respond_to do |format|
      if @ephemeri.save
        format.html { redirect_to ephemeris_path }
        format.json { render json: @ephemeri, status: 200 }
      else
        format.html { render :new }
        format.json { render json: @ephemeri.errors.full_messages, status: 500 }
      end
    end
  end

  def edit
    @ephemeri = Ephemeri.find(params[:id])
  end

  def update
    @ephemeri = Ephemeri.find(params[:id])
    respond_to do |format|
      if @ephemeri.update(ephemeri_params)
        format.html { redirect_to ephemeris_path }
        format.json { render json: @ephemeri, status: 200 }
      else
        format.html { render :new }
        format.json { render json: @ephemeri.errors.full_messages, status: 500 }
      end
    end
  end

  private

  def ephemeri_params
    params.required(:ephemeri).permit(:name, :happened, :category, :image)
  end
end