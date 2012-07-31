class Stopwatch

  DEFAULT_HANDLER = lambda { | time, label | puts "#{ time } seconds elapsed for #{ label }" }

  attr_accessor :label

  attr_reader :duration

  def initialize(&block)
    @result_handler = block_given? ? block : DEFAULT_HANDLER
  end

  def start(label = '')
    @label = label
    set_start_time
  end

  def restart(label = nil)
    ensure_running_state

    result = stop
    reset & start(label || @label || '')
    result
  end

  def stop
    ensure_running_state

    @duration = end_time
    @result_handler.call(@duration, @label)
    @start_time = nil
    @duration
  end

  def reset
    @duration = @start_time = nil
  end

  def running?
    !@start_time.nil?
  end

  def self.create_and_start(label = '', &block)
    watch = Stopwatch.new(&block)
    watch.start(label)
    watch
  end

  private

  def ensure_running_state
    raise "Stopwatch not started!" unless running?
  end

  def set_start_time
    @start_time = Time.now.to_f
  end

  def end_time
    Time.now.to_f - @start_time
  end

end