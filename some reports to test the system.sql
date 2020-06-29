


/* report with cuurent specialzation we have in the hospital*/
select distinct specialization from DOCTOR;



-- patient data with spesefic id 
select * from patient where PATID=15;





-- sort doctors acoording to salary from lowest to bigger
select firstname as doctorname ,salary from DOCTOR order by salary;

select * from doctor;





--report with doctor with specialist postions with salary bigger than 15000
select firstname as doctorname ,pos as position ,SPECIALIZATION, salary from DOCTOR
where pos='specialist' and salary>15000;





--nurses salay average 
select AVG (salary) as nursesaverageslary from NURSE;





--report number of nurses specialization in hospital
select count(distinct specialization)as numberofnursespecialization from NURSE;








--report with monthly paid
select sum(salary) from (select salary from doctor union all
select salary from NURSE union all
select salary from PHYSICAN union all 
select salary from PHARMACIST union all
select salary from EMPLOYEE);






select medicalExamanation.vezeeta from medicalExamanation
inner join patient on patient.PATID = 56;










select sum(salary) from doctor;


































