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
    
    => 1.00 seconds elapsed for testing 


Custom result handler:

    sw = Stopwatch.new { | time, label | puts "parsing #{ label } took #{ time }s" }
    sw.start("xml")
    
    // do slooooooow stuff
    sw.stop
    
    => parsing xml took 2.68600010871887s


Multiple measurements and factory instantiation:

    sw = Stopwatch.create_and_start("GET") { | time, label | puts "finished #{ label } in #{ time }"  } 
    sw.restart("POST")
    => finished GET in 3.21600008010864
      
    sw.running?
    => true
    
    sw.stop
    => finished POST in 2.43900012969971
    
    sw.duration
    => 2.43900012969971

