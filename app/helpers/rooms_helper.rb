module RoomsHelper
  def done?(item)
    unless item.blank?
      content_tag :i,nil,class:"fa fa-check col-6 text-success"
    else
      content_tag :i,nil,class:"col-6 text-success"
    end
  end

  def ready?(room)
    !room.price.blank? && !room.summary.blank? && !room.photos.blank? && !room.address.blank?
  end

end
