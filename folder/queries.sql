CREATE TABLE student (
    sid INT PRIMARY KEY,
    sname VARCHAR(100) NOT NULL,
    sex CHAR(1) CHECK (sex IN ('M', 'F')),
    age INT CHECK (age > 0),
    year INT CHECK (year > 0),
    gpa DECIMAL(4,3) CHECK (gpa >= 0.000 AND gpa <= 4.000)
);

CREATE TABLE dept (
    dname VARCHAR(100) PRIMARY KEY,
    numphds INT CHECK (numphds >= 0)
);

CREATE TABLE prof (
    pname VARCHAR(100) PRIMARY KEY,
    dname VARCHAR(100),
    FOREIGN KEY (dname) REFERENCES dept(dname)
);

CREATE TABLE course (
    cno INT,
    cname VARCHAR(100) NOT NULL,
    dname VARCHAR(100),
    PRIMARY KEY (cno, dname),
    FOREIGN KEY (dname) REFERENCES dept(dname)
);

CREATE TABLE major (
    dname VARCHAR(100),
    sid INT,
    PRIMARY KEY (dname, sid),
    FOREIGN KEY (dname) REFERENCES dept(dname),
    FOREIGN KEY (sid) REFERENCES student(sid)
);

CREATE TABLE section (
    dname VARCHAR(100),
    cno INT,
    sectno INT,
    pname VARCHAR(100),
    PRIMARY KEY (dname, cno, sectno),
    FOREIGN KEY (dname, cno) REFERENCES course(dname, cno),
    FOREIGN KEY (pname) REFERENCES prof(pname)
);

CREATE TABLE enroll (
    sid INT,
    grade CHAR(2),
    dname VARCHAR(100),
    cno INT,
    sectno INT,
    PRIMARY KEY (sid, dname, cno, sectno),
    FOREIGN KEY (sid) REFERENCES student(sid),
    FOREIGN KEY (dname, cno, sectno) REFERENCES section(dname, cno, sectno)
);

-- 1. Print the names of professors who work in departments that have fewer than 50 PhD students.
SELECT pname FROM prof WHERE dname IN (SELECT dname FROM dept WHERE numphds < 50);

-- 2. Print the names of the students with the lowest GPA.
SELECT sname FROM student WHERE gpa = (SELECT MIN(gpa) FROM student);

-- 3. For each Computer Sciences class, print the class number, section number, and the average GPA of the students enrolled in the class section.
SELECT s.cno, s.sectno, AVG(st.gpa) AS avg_gpa FROM section s
JOIN enroll e ON s.dname = e.dname AND s.cno = e.cno AND s.sectno = e.sectno
JOIN student st ON e.sid = st.sid
WHERE s.dname = 'Computer Sciences'
GROUP BY s.cno, s.sectno;

-- 4. Print the names and section numbers of all sections with more than six students enrolled in them.
SELECT s.dname, s.cno, s.sectno FROM section s
JOIN enroll e ON s.dname = e.dname AND s.cno = e.cno AND s.sectno = e.sectno
GROUP BY s.dname, s.cno, s.sectno
HAVING COUNT(e.sid) > 6;

-- 5. Print the name(s) and sid(s) of the student(s) enrolled in the most sections.
SELECT s.sid, s.sname FROM student s
JOIN enroll e ON s.sid = e.sid
GROUP BY s.sid, s.sname
HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM enroll GROUP BY sid) AS subquery);

-- 6. Print the names of departments that have one or more majors who are under 18 years old.
SELECT DISTINCT m.dname FROM major m
JOIN student s ON m.sid = s.sid
WHERE s.age < 18;

-- 7. Print the names and majors of students who are taking one of the College Geometry courses.
SELECT s.sname, m.dname FROM student s
JOIN enroll e ON s.sid = e.sid
JOIN course c ON e.cno = c.cno AND e.dname = c.dname
JOIN major m ON s.sid = m.sid
WHERE c.cname LIKE '%College Geometry%';

-- 8. For those departments that have no major taking a College Geometry course, print the department name and the number of PhD students in the department.
SELECT d.dname, d.numphds FROM dept d
WHERE d.dname NOT IN (
    SELECT DISTINCT m.dname FROM major m
    JOIN enroll e ON m.sid = e.sid
    JOIN course c ON e.cno = c.cno AND e.dname = c.dname
    WHERE c.cname LIKE '%College Geometry%'
);

-- 9. Print the names of students who are taking both a Computer Sciences course and a Mathematics course.
SELECT s.sname FROM student s
WHERE s.sid IN (
    SELECT e.sid FROM enroll e
    JOIN course c ON e.cno = c.cno AND e.dname = c.dname
    WHERE c.dname = 'Computer Sciences'
)
AND s.sid IN (
    SELECT e.sid FROM enroll e
    JOIN course c ON e.cno = c.cno AND e.dname = c.dname
    WHERE c.dname = 'Mathematics'
);

-- 10. Print the age difference between the oldest and the youngest Computer Sciences major.
SELECT MAX(s.age) - MIN(s.age) AS age_difference FROM student s
JOIN major m ON s.sid = m.sid
WHERE m.dname = 'Computer Sciences';

-- 11. For each department that has one or more majors with a GPA under 1.0, print the name of the department and the average GPA of its majors.
SELECT m.dname, AVG(s.gpa) AS avg_gpa FROM major m
JOIN student s ON m.sid = s.sid
WHERE s.gpa < 1.0
GROUP BY m.dname;

-- 12. Print the ids, names, and GPAs of the students who are currently taking all the Civil Engineering courses.
SELECT s.sid, s.sname, s.gpa FROM student s
WHERE NOT EXISTS (
    SELECT c.cno FROM course c WHERE c.dname = 'Civil Engineering'
    EXCEPT
    SELECT e.cno FROM enroll e WHERE e.sid = s.sid AND e.dname = 'Civil Engineering'
);
