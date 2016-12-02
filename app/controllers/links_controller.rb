class LinksController < ApplicationController
  def new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      @short_url = "http://localhost:3000/" + @link.short_url
      render :new
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def show
    @link = Link.find_by(short_url: params[:short_url])

    redirect_to @link.long_url
  end

  private

  def link_params
    params.require(:link).permit(:long_url)
  end
end
