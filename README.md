stopwatch.rb
============

A nice stop watch to measure time spans.

Usage:
------

Simple case:

    sw = Stopwatch.new
    sw.start("testing")

    sleep(1)
    sw.stop
    
    => testing: 1.829139s


Custom result handler:

    sw = Stopwatch.new { | time, label | puts "parsing #{ label } took #{ time }s" }
    sw.start("xml")
    
    sw.running?
    => true

    sw.stop
    => parsing xml took 2.68600010871887s


Multiple measurements and factory instantiation:

    sw = Stopwatch.create_started("GET") do | time, label |
      # Report to tracking service...
      puts "finished #{ label } in #{ time }"
    end
    
    sw.restart("POST")
    => finished GET in 3.21600008010864
    
    sw.stop
    => finished POST in 2.43900012969971
    
    sw.duration
    => 2.43900012969971

