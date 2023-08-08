SELECT * 
From jobs;

SELECT count(*) 
From employees;

SELECT hire_date
From employees;

DD/MM/YYYY  HH:MI:SS

SELECT to_char(sysdate+2, 'DD/MM/YYYY HH:MI:SS') as Tiempo
From dual;

SELECT to_char(sysdate+3/24, 'DD/MM/YYYY HH:MI:SS') as Tiempo
From dual;


SELECT to_date('31/03/2023 09:30:00', 'DD/MM/YYYY HH:MI:SS') as Tiempo
From dual;

SELECT to_date('31/03/2023 09:30:00','DD/MM/YYYY HH:MI:SS')+ 2/24 as Tiempo
From dual;

Select Instr('UCATECIANO','A') From Dual;




