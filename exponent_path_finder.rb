class ExponentPathFinder
  attr_accessor :power, :paths, :cost, :shortest_route

  def initialize(power)
    @power = power
    @paths = [[1]]
  end

  def shortest_path
    found_shortest_path = @paths.select{|path| path.last == @power}.empty? ? false : true
    if found_shortest_path
      @shortest_route = @paths.select{|path| path.last == @power}.first
      @cost = @shortest_route.size - 1
    else
      path_finder
      shortest_path
    end
  end

  private

  def path_finder
    if @paths.first.size < 2
      @paths = [[1,2]]
    else
      new_paths = []
      @paths.each do |path|
        last_element = path.last
        current_paths = path
        path.each do |p|
          new_element = p + last_element
          new_paths << (current_paths.flatten + [new_element]).uniq if new_element <= @power
        end
      end
      @paths = new_paths
    end
  end
end