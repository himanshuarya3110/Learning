1. Find professors in departments with fewer than 50 PhD students.
SELECT pname 
FROM prof 
WHERE dname IN (
    SELECT dname 
    FROM dept 
    WHERE numphds < 50
);

Explanation:
The inner query (SELECT dname FROM dept WHERE numphds < 50) fetches departments with fewer than 50 PhD students.
The outer query selects pname from the prof table where the dname matches one of those departments.

2. Find students with the lowest GPA.
SELECT sid, sname 
FROM student 
WHERE gpa = (SELECT MIN(gpa) FROM student);

Explanation:
SELECT MIN(gpa) FROM student gets the lowest GPA from the student table.
The outer query fetches all students whose gpa is equal to this minimum GPA.

3. Find the average GPA for each Computer Science class section.
SELECT s.cno, s.sectno, AVG(st.gpa) AS avg_gpa 
FROM sections s 
JOIN enroll e ON s.dname = e.dname AND s.cno = e.cno AND s.sectno = e.sectno 
JOIN student st ON e.sid = st.sid 
WHERE s.dname = 'Computer Sciences' 
GROUP BY s.cno, s.sectno;

Explanation:

The query joins sections, enroll, and student to link courses, enrollments, and student GPA.
It filters only Computer Sciences courses.
AVG(st.gpa) calculates the average GPA for each course section.
GROUP BY s.cno, s.sectno ensures averages are calculated per course and section.

4. Find sections with more than six students enrolled.
SELECT s.dname, s.cno, s.sectno 
FROM sections s 
JOIN enroll e ON s.dname = e.dname AND s.cno = e.cno AND s.sectno = e.sectno 
GROUP BY s.dname, s.cno, s.sectno 
HAVING COUNT(e.sid) > 6;

Explanation:

Counts students enrolled in each section.
Uses HAVING COUNT(e.sid) > 6 to filter sections with more than six students.

5. Find students enrolled in the most sections.
SELECT s.sid, s.sname 
FROM student s 
JOIN enroll e ON s.sid = e.sid 
GROUP BY s.sid, s.sname 
HAVING COUNT(e.sectno) = (
    SELECT MAX(section_count) 
    FROM (
        SELECT COUNT(e2.sectno) AS section_count 
        FROM enroll e2 
        GROUP BY e2.sid
    ) AS subquery
);

Explanation:

The subquery counts how many sections each student is enrolled in and finds the maximum.
The outer query selects students who are enrolled in exactly that maximum number of sections.

6. Find departments with at least one major under 18.
SELECT DISTINCT m.dname 
FROM major m 
JOIN student s ON m.sid = s.sid 
WHERE s.age < 18;

Explanation:

Joins major and student tables to check the age of students.
Filters students under 18 and selects unique department names.

7. Find students taking a College Geometry course and their major.
SELECT s.sname, m.dname 
FROM student s 
JOIN enroll e ON s.sid = e.sid 
JOIN course c ON e.cno = c.cno AND e.dname = c.dname 
JOIN major m ON s.sid = m.sid 
WHERE c.cname LIKE '%College Geometry%';

Explanation:

Joins student, enroll, course, and major tables to find students taking a College Geometry course.
Uses LIKE '%College Geometry%' to match courses with "College Geometry" in the name.

8. Find departments with no majors taking College Geometry and their PhD student count.
SELECT d.dname, d.numphds 
FROM dept d 
WHERE d.dname NOT IN (
    SELECT DISTINCT m.dname 
    FROM major m 
    JOIN enroll e ON m.sid = e.sid 
    JOIN course c ON e.cno = c.cno AND e.dname = c.dname 
    WHERE c.cname LIKE '%College Geometry%'
);

Explanation:

The subquery finds departments with majors taking College Geometry.
The outer query selects departments not in this list.

9. Find students taking both a Computer Sciences and a Mathematics course.
SELECT s.sname 
FROM student s 
WHERE s.sid IN (
    SELECT e.sid 
    FROM enroll e 
    JOIN course c ON e.cno = c.cno AND e.dname = c.dname 
    WHERE c.dname = 'Computer Sciences'
) 
AND s.sid IN (
    SELECT e.sid 
    FROM enroll e 
    JOIN course c ON e.cno = c.cno AND e.dname = c.dname 
    WHERE c.dname = 'Mathematics'
);

Explanation:

Finds students enrolled in Computer Sciences courses.
Finds students enrolled in Mathematics courses.
Selects students appearing in both lists.

  
10. Find the age difference between the oldest and youngest Computer Sciences major.
SELECT MAX(s.age) - MIN(s.age) AS age_difference 
FROM student s 
JOIN major m ON s.sid = m.sid 
WHERE m.dname = 'Computer Sciences';

Explanation:

Finds the max and min age of Computer Sciences majors and subtracts them.

11. Find departments with students having a GPA under 1.0 and their average GPA.
SELECT m.dname, AVG(s.gpa) AS avg_gpa 
FROM major m 
JOIN student s ON m.sid = s.sid 
WHERE s.gpa < 1.0 
GROUP BY m.dname;

Explanation:

Finds students with a GPA below 1.0.
Groups them by department and calculates the average GPA per department.

12. Find students taking all Civil Engineering courses.
SELECT s.sid, s.sname, s.gpa 
FROM student s 
WHERE NOT EXISTS (
    SELECT c.cno 
    FROM course c 
    WHERE c.dname = 'Civil Engineering'
    EXCEPT 
    SELECT e.cno 
    FROM enroll e 
    WHERE e.sid = s.sid AND e.dname = 'Civil Engineering'
);

Explanation:

The subquery (SELECT c.cno FROM course c WHERE c.dname = 'Civil Engineering') gets all Civil Engineering courses.
EXCEPT SELECT e.cno FROM enroll e WHERE e.sid = s.sid AND e.dname = 'Civil Engineering' finds courses the student is missing.
NOT EXISTS ensures the student is taking all courses.
