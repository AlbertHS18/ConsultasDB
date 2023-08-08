Select nombre, fecha, años_servicios, salario_anterior, Porciento_aumento, 
to_char(salario_anterior * (1+(Porciento_aumento/100)), '999,999.99') as Nuevo_Salario
from (
SELECT
    first_name || ' ' || last_name AS nombre,
    hire_date as fecha,
    TRUNC((SYSDATE - hire_date) / 365) AS años_servicios,
    salary AS salario_anterior,
    CASE
        WHEN TRUNC((SYSDATE - hire_date) / 365) BETWEEN 1 AND 24 THEN 5
        WHEN TRUNC((SYSDATE - hire_date) / 365) BETWEEN 25 AND 27 THEN 10
        WHEN TRUNC((SYSDATE - hire_date) / 365) BETWEEN 28 AND 29 THEN 15
        ELSE 20
    END AS Porciento_aumento
FROM employees 
);