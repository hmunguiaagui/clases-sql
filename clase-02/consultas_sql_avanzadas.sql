USE enterprise_db;
-- Seleccionar el nombre, el puesto y la localidad de los departamentos donde trabajan los vendedores.
SELECT e.first_name, e.rank, s.location FROM employee e JOIN section s ON e.sect_id = s.id WHERE s.name = 'Ventas'; 
-- Visualizar los departamentos con más de cinco empleados.
SELECT s.name, COUNT(e.sect_id) AS section_count FROM employee e JOIN section s ON e.sect_id = s.id GROUP BY s.name HAVING section_count > 5;
-- Mostrar el nombre, salario y nombre del departamento de los empleados que tengan el mismo puesto que ‘Juan Pérez’.
SELECT e.first_name, e.payment, s.name FROM employee e JOIN section s ON e.sect_id = s.id WHERE e.rank = (SELECT em.rank FROM employee em WHERE em.first_name = 'Juan' AND em.last_name = 'Pérez');
-- Mostrar los datos de los empleados que trabajan en el departamento de contabilidad, ordenados por nombre.
SELECT * FROM employee e JOIN section s ON e.sect_id = s.id WHERE s.name = 'Contabilidad' ORDER BY e.first_name;
-- Mostrar el nombre del empleado que tiene el salario más bajo.
SELECT e.first_name FROM employee e WHERE e.payment = (SELECT MIN(em.payment) FROM employee em);
-- Mostrar los datos del empleado que tiene el salario más alto en el departamento de ‘Ventas’.
SELECT * FROM employee e WHERE e.payment = (SELECT em.payment FROM employee em JOIN section se ON em.sect_id = se.id WHERE se.name = 'Ventas' ORDER BY em.payment DESC LIMIT 1) AND e.sect_id = (SELECT s.id FROM section s WHERE s.name = 'Ventas');