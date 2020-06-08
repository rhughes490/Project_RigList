require_relative( '../models/oil_worker.rb' )
require_relative( '../models/wish_list.rb' )
require_relative( '../models/rig.rb' )
require_relative( '../models/oil_company.rb')
require_relative( '../models/flight.rb' )

require( 'pry-byebug' )

Flight.delete_all()
Wish_list.delete_all()
Oil_company.delete_all()
Rig.delete_all()
Oil_worker.delete_all()

oil_worker1 = Oil_worker.new({ 'first_name' => 'Ahmed', 'last_name' => 'Hamed', 'contact_num' => '07762589803'})
oil_worker1.save()
oil_worker2 = Oil_worker.new({ 'first_name' => 'Keith', 'last_name' => 'Nimmo', 'contact_num' => '07762583453'})
oil_worker2.save()
oil_worker3 = Oil_worker.new({ 'first_name' => 'Nourhan', 'last_name' => 'Elhakim', 'contact_num' => '07923482980'})
oil_worker3.save()
oil_worker4 = Oil_worker.new({ 'first_name' => 'Adam', 'last_name' => 'Koziel', 'contact_num' => '07773562243'})
oil_worker4.save()
oil_worker5 = Oil_worker.new({ 'first_name' => 'Craig', 'last_name' => 'McLeod', 'contact_num' => '07768067908'})
oil_worker5.save()
oil_worker6 = Oil_worker.new({ 'first_name' => 'Ed', 'last_name' => 'Cant', 'contact_num' => '07702384903'})
oil_worker6.save()
oil_worker7 = Oil_worker.new({ 'first_name' => 'Jack', 'last_name' => 'Morris', 'contact_num' => '07703452903'})
oil_worker7.save()
oil_worker8 = Oil_worker.new({ 'first_name' => 'Ollie', 'last_name' => 'Boyd', 'contact_num' => '07705645643'})
oil_worker8.save()
oil_worker9 = Oil_worker.new({ 'first_name' => 'Rumen', 'last_name' => 'Roger', 'contact_num' => '07705464643'})
oil_worker9.save()
oil_worker10 = Oil_worker.new({ 'first_name' => 'Sara', 'last_name' => 'Emanuelsson', 'contact_num' => '07756435603'})
oil_worker10.save()

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

flight1 = Flight.new({ 'oil_worker_id' => oil_worker1.id, 'rig_id' => rig1.id, 'date' => '13 December 2015'})
flight1.save()
flight2 = Flight.new({ 'oil_worker_id' => oil_worker1.id, 'rig_id' => rig4.id, 'date' => '15 December 2021'})
flight2.save()
flight3 = Flight.new({ 'oil_worker_id' => oil_worker2.id, 'rig_id' => rig1.id, 'date' => '21 September 2019'})
flight3.save()
flight4 = Flight.new({ 'oil_worker_id' => oil_worker3.id, 'rig_id' => rig5.id, 'date' => '29 January 2020'})
flight4.save()
flight5 = Flight.new({ 'oil_worker_id' => oil_worker4.id, 'rig_id' => rig6.id, 'date' => '18 May 2016'})
flight5.save()
flight6 = Flight.new({ 'oil_worker_id' => oil_worker4.id, 'rig_id' => rig2.id, 'date' => '10 November 2020'})
flight6.save()
flight7 = Flight.new({ 'oil_worker_id' => oil_worker4.id, 'rig_id' => rig3.id, 'date' => '03 March 2021'})
flight7.save()
flight8 = Flight.new({ 'oil_worker_id' => oil_worker5.id, 'rig_id' => rig2.id, 'date' => '24 March 2020'})
flight8.save()
flight9 = Flight.new({ 'oil_worker_id' => oil_worker5.id, 'rig_id' => rig6.id, 'date' => '14 April 2010'})
flight9.save()
flight10 = Flight.new({ 'oil_worker_id' => oil_worker6.id, 'rig_id' => rig2.id, 'date' => '16 June 2018'})
flight10.save()
flight11 = Flight.new({ 'oil_worker_id' => oil_worker6.id, 'rig_id' => rig5.id, 'date' => '26 July 2015'})
flight11.save()
flight12 = Flight.new({ 'oil_worker_id' => oil_worker6.id, 'rig_id' => rig4.id, 'date' => '07 October 2020'})
flight12.save()

wish_list1 = Wish_list.new({ 'oil_worker_id' => oil_worker1.id, 'rig_id' => rig2.id})
wish_list1.save()
wish_list2 = Wish_list.new({ 'oil_worker_id' => oil_worker1.id, 'rig_id' => rig5.id})
wish_list2.save()
wish_list3 = Wish_list.new({ 'oil_worker_id' => oil_worker2.id, 'rig_id' => rig6.id})
wish_list3.save()
wish_list4 = Wish_list.new({ 'oil_worker_id' => oil_worker3.id, 'rig_id' => rig3.id})
wish_list4.save()
wish_list5 = Wish_list.new({ 'oil_worker_id' => oil_worker4.id, 'rig_id' => rig4.id})
wish_list5.save()
wish_list6 = Wish_list.new({ 'oil_worker_id' => oil_worker4.id, 'rig_id' => rig5.id})
wish_list6.save()
wish_list7 = Wish_list.new({ 'oil_worker_id' => oil_worker5.id, 'rig_id' => rig1.id})
wish_list7.save()
wish_list8 = Wish_list.new({ 'oil_worker_id' => oil_worker5.id, 'rig_id' => rig3.id})
wish_list8.save()
wish_list9 = Wish_list.new({ 'oil_worker_id' => oil_worker6.id, 'rig_id' => rig1.id})
wish_list9.save()
wish_list10 = Wish_list.new({ 'oil_worker_id' => oil_worker6.id, 'rig_id' => rig3.id})
wish_list10.save()
wish_list11 = Wish_list.new({ 'oil_worker_id' => oil_worker6.id, 'rig_id' => rig6.id})
wish_list11.save()

oil_company1 = Oil_company.new({ 'name' => 'Shell', 'type' => 'Production'})
oil_company1.save()
oil_company2 = Oil_company.new({ 'name' => 'BP', 'type' => 'Production'})
oil_company2.save()
oil_company3 = Oil_company.new({ 'name' => 'Paragon', 'type' => 'Drilling'})
oil_company3.save()
oil_company4 = Oil_company.new({ 'name' => 'Equinor', 'type' => 'Producer'})
oil_company4.save()
oil_company5 = Oil_company.new({ 'name' => 'Valaris', 'type' => 'Drilling'})
oil_company5.save()


binding.pry
nil
