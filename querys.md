# Студентські гуртожитки


---

Вибрати всіх студентів які проживають в кімнаті “708-Б”
```sql
select first_name, last_name, student_number from student
inner join room r on student.room_id = r.id
where r.apartment_number='708-Б';
```

---

Вибрати всіх студентів які проживають в 2 гуртожитку
```sql
select first_name, last_name, student_number from student
inner join room r on student.room_id = r.id
inner join dormitory d on r.dormitory_id = d.id
where d.name='Гуртожиток №2';
```

---

Вибрати всі договори студента “Serhii Khortiuk”
```sql
select s.first_name, s.last_name, course, contract_number, count, date
from contract
inner join student s on contract.student_id = s.student_number
where s.last_name='Khortiuk';
```

---

Вибрати всіх студентів які провели оплату за кімнати
```sql
select first_name, last_name, course, c.count
from student
inner join contract c on student.student_number = c.student_id;
```

---

Вибрати всі гуртожитки в місті “Чернівці”
```sql
select c.name, u.name from city c
inner join university u on c.post_code=u.location_id
where c.name='Чернівці';
```

---

Вибрати всі кімнати які належать Гуртожитку №2 м.Івано-Франківськ
```sql
select r.apartment_number from room r
inner join dormitory d on r.dormitory_id = d.id
inner join university u on d.university_id = u.id
inner join city c on c.post_code=u.location_id
where c.name='Івано-Франківськ' and d.name='Гуртожиток №2';
```

---

Вибрати найбільшу суму оплати в договорі
```sql
select s.first_name, s.last_name, c.count from contract c
inner join student s on c.student_id = s.student_number
order by c.count desc
limit 1;
```

---

Вибрати студентів які проживають в кімнаті “716-А”
```sql
select s.first_name, s.last_name, r.apartment_number from room r
inner join student s on r.id = s.room_id
where r.apartment_number='716-A';
```

---

Вибрати всі договори про оплату кімнати “708-Б”
```sql
select c.contract_number, c.count, c.date from contract c
inner join room r on c.room_id = r.id
where r.apartment_number='708-Б';
```
---
