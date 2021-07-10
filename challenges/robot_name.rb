class Robot
  attr_reader :name
  @@used_names = []

  def initialize
    until name do
      @@used_names << get_name
      name_not_used? ? @name = @@used_names.last : @@used_names.pop
    end
  end

  def name_not_used?
    @@used_names.length == @@used_names.uniq.length
  end

  def get_name
    "#{get_prefix}#{get_suffix}"
  end

  def get_prefix
    prefix = ''
    2.times { prefix << ('A'..'Z').to_a.sample }
    prefix
  end

  def get_suffix
    (100...999).to_a.sample
  end

  def reset
    @name = get_name
  end
end
