# no 1
SELECT p.id   AS 'Person ID',
       p.name AS Name,
       h.id   AS 'Hobi ID',
       h.name AS Hobi

FROM persons p
         JOIN person_hobbies ph ON p.id = ph.person_id
         JOIN hobbies h ON ph.hobby_id = h.id;

# no : 2
SELECT p.id   AS 'Person ID',
       p.name AS Name,
       h.id   AS 'Hobi ID',
       h.name AS Hobi

FROM persons p
         LEFT JOIN person_hobbies ph ON p.id = ph.person_id
         LEFT JOIN hobbies h ON ph.hobby_id = h.id;

# no: 3
SELECT p.id   AS 'Person ID',
       p.name AS Name,
       h.id   AS 'Hobi ID',
       h.name AS Hobi

FROM persons p
         RIGHT JOIN person_hobbies ph ON p.id = ph.person_id
         RIGHT JOIN hobbies h ON ph.hobby_id = h.id;

# no: 4
SELECT p.id   AS 'Person ID',
       p.name AS Name,
       h.id   AS 'Hobi ID',
       h.name AS Hobi

FROM persons p
         LEFT JOIN person_hobbies ph ON p.id = ph.person_id
         LEFT JOIN hobbies h ON ph.hobby_id = h.id
UNION
SELECT p.id   AS 'Person ID',
       p.name AS Name,
       h.id   AS 'Hobi ID',
       h.name AS Hobi
FROM persons p
         RIGHT JOIN person_hobbies ph ON p.id = ph.person_id
         RIGHT JOIN hobbies h ON ph.hobby_id = h.id
WHERE p.id IS NULL;


# no: 5
SELECT IFNULL(p.id, '-')   AS 'Person ID',
       IFNULL(p.name, '-') AS Name,
       IFNULL(GROUP_CONCAT(h.name), '-')  AS Hobi

FROM persons p
         LEFT JOIN person_hobbies ph ON p.id = ph.person_id
         LEFT JOIN hobbies h ON ph.hobby_id = h.id
GROUP BY p.id
UNION
SELECT IFNULL(p.id, '-')   AS 'Person ID',
       IFNULL(p.name, '-') AS Name,
       IFNULL(GROUP_CONCAT(h.name), '-')  AS Hobi
FROM persons p
         RIGHT JOIN person_hobbies ph ON p.id = ph.person_id
         RIGHT JOIN hobbies h ON ph.hobby_id = h.id
WHERE p.id IS NULL
GROUP BY p.id
ORDER BY `Person ID` ASC;


