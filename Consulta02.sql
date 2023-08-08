-- Esta consulta calcula el aumento salarial y muestra los resultados para cada empleado.

SELECT
    -- Concatenamos el primer y último nombre para mostrar el nombre completo.
    first_name || ' ' || last_name AS nombre,
    hire_date, -- Fecha de contratación del empleado.
    
    -- Calculamos los años de servicio dividiendo la diferencia entre la fecha actual y la de contratación por 365.
    TRUNC((SYSDATE - hire_date) / 365) AS años_servicios,
    
    -- Definimos un CASE para determinar el porcentaje de aumento según los años de servicio.
    CASE
        WHEN TRUNC((SYSDATE - hire_date) / 365) BETWEEN 0 AND 15 THEN 0.05
        WHEN TRUNC((SYSDATE - hire_date) / 365) BETWEEN 16 AND 20 THEN 0.10
        ELSE 0.20
    END AS aumento_porcentaje,
    
    salary AS salario_anterior, -- Salario anterior del empleado.
    
    -- Calculamos el salario aumentado aplicando el porcentaje de aumento.
    ROUND(salary * (1 + 
        CASE
            WHEN TRUNC((SYSDATE - hire_date) / 365) BETWEEN 0 AND 15 THEN 0.05
            WHEN TRUNC((SYSDATE - hire_date) / 365) BETWEEN 16 AND 20 THEN 0.10
            ELSE 0.20
        END
    ), 2) AS salario_aumentado,
    
    -- Definimos otro CASE para mostrar el porcentaje de aumento como texto.
    CASE
        WHEN TRUNC((SYSDATE - hire_date) / 365) BETWEEN 0 AND 15 THEN '5%'
        WHEN TRUNC((SYSDATE - hire_date) / 365) BETWEEN 16 AND 20 THEN '10%'
        ELSE '20%'
    END AS aumento_efectuado
FROM employees;