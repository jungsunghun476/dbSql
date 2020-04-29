巩力 8
SELECT  regions.region_id, region_name, country_name
FROM countries, regions
WHERE regions.region_id = countries.region_id AND region_name = 'Europe';

巩力 9
SELECT regions.region_id, region_name, country_name, city
FROM countries, regions, locations
WHERE regions.region_id = countries.region_id AND locations.country_id = countries.country_id AND region_name = 'Europe';

巩力 10
SELECT regions.region_id, region_name, country_name, city, department_name
FROM countries, regions, locations, departments 
WHERE regions.region_id = countries.region_id 
    AND locations.country_id = countries.country_id 
    AND locations.location_id = departments.location_id 
    AND region_name = 'Europe';
      
巩力 11
SELECT regions.region_id, region_name, country_name, city, department_name, first_name || last_name name
FROM countries, regions, locations, departments, employees
WHERE regions.region_id = countries.region_id 
        AND locations.country_id = countries.country_id 
        AND locations.location_id = departments.location_id 
        AND employees.department_id = departmentS.department_id 
        AND region_name = 'Europe';

巩力 12
SELECT employee_id, first_name || last_name name, jobs.job_id, job_title
FROM employees, jobs
WHERE employees.job_id = jobs.job_id;

巩力 13
SELECT employees.employee_id mgr_id, employees.first_name || employees.last_name mgr_name, employees.employee_id
FROM employees a JOIN employees b ON (a.employee_id = b.manager_id),
jobs JOIN employees ON (jobs.job_id = employees.job_id);