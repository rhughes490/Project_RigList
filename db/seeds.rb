require_relative( '../models/oil_worker.rb' )
require_relative( '../models/rig.rb' )
require_relative( '../models/flight.rb' )

require( 'pry-byebug' )

Flight.delete_all()
Rig.delete_all()
Oil_worker.delete_all()

oil_worker1 = Oil_worker.new({ 'first_name' => 'Mike', 'last_name' => 'Williams', 'contact_num' => '07762589803'})
oil_worker1.save()
oil_worker2 = Oil_worker.new({ 'first_name' => 'Red', 'last_name' => 'Adair', 'contact_num' => '0776258345325'})
oil_worker2.save()
oil_worker3 = Oil_worker.new({ 'first_name' => 'Daniel', 'last_name' => 'Plainview', 'contact_num' => '079234829803'})
oil_worker3.save()
oil_worker4 = Oil_worker.new({ 'first_name' => 'Harry', 'last_name' => 'Stamper', 'contact_num' => '07773562243'})
oil_worker4.save()
oil_worker5 = Oil_worker.new({ 'first_name' => 'A.J.', 'last_name' => 'Frost', 'contact_num' => '077680679058'})
oil_worker5.save()
oil_worker6 = Oil_worker.new({ 'first_name' => 'Eli', 'last_name' => 'Sunday', 'contact_num' => '077023845903'})
oil_worker6.save()

binding.pry

rig1 = Rig.new({ 'name' => 'Nelson', 'type' => 'Platform', 'distance' => '120', 'country' => 'UK'})
rig1.save()
rig2 = Rig.new({ 'name' => 'Shearwater', 'type' => 'Platform', 'distance' => '100', 'country' => 'UK'})
rig2.save()
rig3 = Rig.new({ 'name' => 'Pioneer', 'type' => 'Semi-Submersible', 'distance' => '80', 'country' => 'UK'})
rig3.save()
rig4 = Rig.new({ 'name' => 'B391', 'type' => 'Jack-up', 'distance' => '20', 'country' => 'UK'})
rig4.save()
rig5 = Rig.new({ 'name' => 'Heidrun', 'type' => 'TLP', 'distance' => '150', 'country' => 'Norway'})
rig5.save()
rig6 = Rig.new({ 'name' => 'F16-A', 'type' => 'Platform', 'distance' => '50', 'country' => 'Netherlands'})
rig6.save()

binding.pry

flight1 = Flight.new({ 'oil_worker_id' => oil_worker1.id, 'rig_id' => rig1.id, 'date' => '13 December 2015', 'status' => 'Previous'})
flight1.save()
flight2 = Flight.new({ 'oil_worker_id' => oil_worker1.id, 'rig_id' => rig4.id, 'date' => '15 December 2021', 'status' => 'Upcoming'})
flight2.save()
flight3 = Flight.new({ 'oil_worker_id' => oil_worker2.id, 'rig_id' => rig1.id, 'date' => '21 September 2019', 'status' => 'Previous'})
flight3.save()
flight4 = Flight.new({ 'oil_worker_id' => oil_worker3.id, 'rig_id' => rig5.id, 'date' => '29 January 2020', 'status' => 'Previous'})
flight4.save()
flight5 = Flight.new({ 'oil_worker_id' => oil_worker4.id, 'rig_id' => rig6.id, 'date' => '18 May 2016', 'status' => 'Previous'})
flight5.save()
flight6 = Flight.new({ 'oil_worker_id' => oil_worker4.id, 'rig_id' => rig2.id, 'date' => '10 November 2020', 'status' => 'Upcoming'})
flight6.save()
flight7 = Flight.new({ 'oil_worker_id' => oil_worker4.id, 'rig_id' => rig3.id, 'date' => '03 March 2021', 'status' => 'Upcoming'})
flight7.save()
flight8 = Flight.new({ 'oil_worker_id' => oil_worker5.id, 'rig_id' => rig2.id, 'date' => '24 March 2020', 'status' => 'Previous'})
flight8.save()
flight9 = Flight.new({ 'oil_worker_id' => oil_worker5.id, 'rig_id' => rig6.id, 'date' => '14 April 2010', 'status' => 'Previous'})
flight9.save()
flight10 = Flight.new({ 'oil_worker_id' => oil_worker6.id, 'rig_id' => rig2.id, 'date' => '16 June 2018', 'status' => 'Previous'})
flight10.save()
flight11 = Flight.new({ 'oil_worker_id' => oil_worker6.id, 'rig_id' => rig5.id, 'date' => '26 July 2015', 'status' => 'Previous'})
flight11.save()
flight12 = Flight.new({ 'oil_worker_id' => oil_worker6.id, 'rig_id' => rig4.id, 'date' => '07 October 2020', 'status' => 'Upcoming'})
flight12.save()


binding.pry
nil
