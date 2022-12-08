--Display Login Page
Select * from login_page;

--Display Student Table
Select * from student;

--Display Room Table
Select * from room;

--Display Fee Table
Select * from fee;

--Display Alloted room
Select * from alloted_rooms;

--Display Facilities
Select * from facilities;

--Display Complaint Table
Select * from complaint;

--Display Entry details
Select * from entry_details;

--Display Staff Details
Select * from staff_details;    

--Simple Queries
select SR_NO,name from student WHERE branch='CSE';
select SR_NO,name,phone_number from STUDENT WHERE address='Gulbarga';
select complaint_id,room_id,Item_id from complaint WHERE Status=0;
select * from room ORDER BY Room_ID ASC;
select * from student WHERE branch LIKE 'CS%';

--Nested queries
-- 1.Get name of students residing in M-block 
select name,SR_NO from student
where student.room_id in (
    select room.room_id 
    from room where Block_no=1
);

--2.get phone number of students who went to therir native place on particular date
select name,phone_number from student
where student.SR_NO in(
    select SR_NO from entry_details
    where exit_time BETWEEN '2022-01-17 00:00:00' AND '2022-02-18 00:00:00'
);

--3. Get email id of students who are from computer science branch and staying in hostel

select Email_id
 from login_page
 where srno in  
(
	select SR_NO from student 
	where branch='CSE'
);

--4. Get complaints and room id from H-block
select Room_id,Complaint_description
from complaint 
where Room_id in  
(
    select Room_id from room
    where Block_no= 02 
);

--5. Select 5 students from m-block who are in 4th semester
select * from student
where room_id in 
(select Room_ID 
from room 
where sem=4 AND Block_no=02
);

--Set operation

--1.Union combines srno and room_no
select SR_NO from student
UNION
select Room_ID from room;



--2.Intersect, list students who paid the fees
select SR_NO from student
intersect 
select SR_NO from fee;
select * from fee;

--Group syntax
--1.Get number of students staying in particular block
select count(SR_NO),room_id from student
 group by room_id;

--2.Group student who went outside of the hostel between two dates
 select count(srno),exit_time from entry_details
 group by exit_time BETWEEN "2022-01-01 00:00:00" and "2022-05-01 00:00:00";


--Having

--1 select room number which is not completely occupied
 
     select room_id,count(SR_NO)
     from student
     group by room_id
     having count(SR_NO)<3;

--2. Select student from block one not belonging to ground floor
    select * from room group by room_id having room_id>320;



--Using Between operator
--Displaying details of students who have left hostel during March
SELECT * from entry_details WHERE exit_time BETWEEN '2022-03-01 00:00:00' AND '2022-04-01 00:00:00';

--Using LIKE operator
select * from student WHERE address LIKE 'Gul%';
select SR_NO,USN,Name,address from student WHERE USN LIKE '%CS%';
select * from complaint WHERE Complaint_description LIKE 'f[!a]n';
