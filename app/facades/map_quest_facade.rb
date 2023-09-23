class MapQuestFacade
  def get_lat_long(location)
    MapQuestService.new.get_lat_long(location)
  end
end