select bookings.booking_id, users.user_name as customer_name, vehicles.name as vehicle_name, bookings.start_date, bookings.end_date, bookings.status 
from bookings 
   join users on bookings.user_id = users.user_id 
   join vehicles on bookings.vehicle_id = vehicles.vehicle_id;

select * from vehicles where not exists (select 1 from bookings where vehicles.vehicle_id = bookings.vehicle_id)order by type;

select * from vehicles where vehicles.type = 'car' and vehicles.status = 'available';



select vehicles.name as vehicle_name, count(*) as total_bookings 
from vehicles 
  join bookings on vehicles.vehicle_id = bookings.vehicle_id 
  group by vehicle_name having (count(*) > 2) ;