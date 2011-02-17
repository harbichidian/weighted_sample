What does it do?
===
Adds a new method called `weighted_sample` to the `Hash` class. Calling this method will give you a random key from the hash, similar to `Array#sample`, except that keys with a greater value will come up more often than those with lower values.

For example:
    h = {a:1, b:1, c:2}
    
    results = 1000.times.collect{ h.weighted_sample }
    h.keys.each{ |key| puts "#{key}: #{results.count key}" }
    #=>
    # a: 256
    # b: 261
    # c: 483
    
    results = 1000.times.collect{ h.weighted_sample }
    h.keys.each{ |key| puts "#{key}: #{results.count key}" }
    #=>
    # a: 255
    # b: 248
    # c: 497
