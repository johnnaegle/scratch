scratch
=======

A Rails scratch repo for testing

Demonstrates the problem in this Stackoverflow.com question: http://stackoverflow.com/questions/14987821/why-doesnt-update-attribute-change-my-timestamp-column

<pre>
  
[15] pry(main)> x=Time.now;sleep(0.1);y=Time.now
=> 2013-02-20 12:06:57 -0600

[16] pry(main)> x.strftime("%Y-%m-%d %H:%M:%S.%L")
=> "2013-02-20 12:06:57.185"

[17] pry(main)> y.strftime("%Y-%m-%d %H:%M:%S.%L")
=> "2013-02-20 12:06:57.286"

[18] pry(main)> kat = Kitten.first
  Kitten Load (1.2ms)  SELECT "kittens".* FROM "kittens" LIMIT 1
=> #<Kitten id: 1,  queued_at: "2013-02-13 20:38:00">

[19] pry(main)> kat.queued_at = x
=> 2013-02-20 12:06:57 -0600

[20] pry(main)> kat.save
   (0.5ms)  BEGIN
   (0.6ms)  UPDATE "kittens" SET "queued_at" = '2013-02-20 18:06:57.185870' WHERE "kittens"."id" = 1
   (1.3ms)  COMMIT
=> true

[21] pry(main)> kat.queued_at = y
=> 2013-02-20 12:06:57 -0600

[22] pry(main)> kat.save
   (0.2ms)  BEGIN
   (0.2ms)  COMMIT
=> true

</pre>