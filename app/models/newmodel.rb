class Newmodel < ActiveFedora::Base

  #here 1

  has_file_datastream "digitalImage"
  has_file_datastream "thumbnail"
  
  #here 2

  def getImage(type)

    if (type == "thumbnail")
      self.thumbnail.content
    else 
      self.digitalImage.content
    end

  end
  
end