class MapQuestFacade
  def get_lat_long(location)
    MapQuestService.new.get_lat_long(location)
  end

  def get_route(start, finish)
    MapQuestService.new.get_route(start, finish)
  end
end