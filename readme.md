## Vehicle Rental System - Database Design & SQL Queries


## Query 1: JOIN.   
<b>Requirement:</b> Retrieve booking information along with Customer name and Vehicle name.


``` sql
SELECT bookings.booking_id, users.user_name AS customer_name, vehicles.name AS vehicle_name, bookings.start_date, bookings.end_date, bookings.status 
FROM bookings 
   JOIN users ON bookings.user_id = users.user_id 
   JOIN vehicles ON bookings.vehicle_id = vehicles.vehicle_id;
```

## Explanation

Here on the above query I am selecting all the booking information from bookings table then joining bookings table with users and vehicles so that I can get access to the information of customer name from users table and vehicle name from vehicles table. 

Booking is the junction table here which connecting both users and vehicles table where for the first join booking with users table I am joining them based on where user id in the booking table (foreign key) = user id on the users table (primary key).  This many to one relation which goes from booking -> users.

For the second join which is users with vehicle I joined them based on where vehicle id on booking table (foreign key) = vehicle id on vehicle table(primary key). this one many to one relation which goes from booking -> vehicles.


## Query 2  
<b>Requirement:</b> Find all vehicles that have never been booked.


```sql
select * from vehicles where not exists (select 1 from bookings where vehicles.vehicle_id = bookings.vehicle_id)order by type;
```

## Explanation

I am selecting all records from the vehicles table where the vehicle ID does not exist in the bookings table by using the NOT EXISTS keyword to match the vehicle ID from the vehicles table with the vehicle ID in the bookings table. This helps me get only those vehicles that have never been booked. I am using ORDER BY type to sort the result based on the vehicle type.


## Query 3

<b>Requirement:</b> Retrieve all available vehicles of a specific type (e.g. cars).


```sql
select * from vehicles where vehicles.type = 'car' and vehicles.status = 'available';
```

## Explanation

Here I am selecting all from vehicles table and setting the condition by using where keyword to type = car and status = available so that I can get only the type of vehicle which is a "car" and also it is "available".


## Query 4

<b>Requirement:</b> Requirement: Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.



```sql
select vehicles.name as vehicle_name, count(*) as total_bookings 
from vehicles 
  join bookings on vehicles.vehicle_id = bookings.vehicle_id 
  group by vehicle_name having (count(*) > 2) ;

```

Here I am selecting name of the vehicle, counting all rows in the vehicle table to find out the total number of vehicles then joining the vehicle table with bookings table so that i can check how many vehicles have been booked and stored in the booking table based on joining table vehicles.vehicle_id = bookings.vehicle_id, lastly using the clause in having count(*) > 2 I am returning all the vehicles that have been booked more the 2 times.