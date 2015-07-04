class ImageviewersController < ApplicationController

	def index
		# %%Modelname%% is titleCase "Telegraph"
		@image = %%modelname%%.find(params[:id]).getImage(params[:type])
		render "index.jpg.erb", layout: false
	end

end
