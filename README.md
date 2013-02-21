scratch
=======

A Rails scratch repo for testing

Demonstrates the problem in this Stackoverflow.com question: http://stackoverflow.com/questions/14987821/why-doesnt-update-attribute-change-my-timestamp-column

<pre>
  
x=Time.now
sleep(0.1)
y=Time.now  

if (x.sec == y.sec)
  puts x.strftime("%Y-%m-%d %H:%M:%S.%L")
  puts y.strftime("%Y-%m-%d %H:%M:%S.%L")
  
  kat = Kitten.create!
  kat.queued_at = x
  
  # this always updates queued at in the database
  kat.save!
  
  kat.queued_at = y
  
  # This will writes to the database in 3.1.11, but not 3.2.12
  kat.save!
  
else
  puts "Seconds must be the same"
end

</pre>