module LoggerHelper
  def log(msg)
    @log = [] unless @log
    @log << msg
  end
  
  def logs
    @log
  end
  
  def log?
    puts "log: #{@log}"
    @log && @log.size > 0
  end
end