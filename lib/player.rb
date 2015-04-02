class Player

  attr_reader :name
  attr_accessor :board, :ships

  def initialize name, ship_class
    @name = name

    # Standard list, can try custom list later:
    @ships = [ship_class.new({size: 5}), ship_class.new({size: 4}),
      ship_class.new({size: 3}), ship_class.new({size: 3}),
      ship_class.new({size: 2})]
  end

  def has_board?
    !board.nil?
  end

  def ready?
    has_board? && board.ready?
  end

  def lost?
    ready? && board.lost?
  end

  def register_shot cell
    board.hit cell
  end

end
