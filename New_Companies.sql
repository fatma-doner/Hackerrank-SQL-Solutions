SELECT company.company_code, company.founder, 
    COUNT(DISTINCT Lead_Manager.Lead_manager_code) AS Lead_manager_count, 
    COUNT(DISTINCT Senior_Manager.Senior_manager_code) AS Senior_Manager_count, 
    COUNT(DISTINCT Manager.manager_code) AS Manager_count, 
    COUNT(DISTINCT Employee.employee_code) AS Employee_count 
FROM company 
    JOIN Lead_Manager ON company.company_code = Lead_Manager.company_code 
    JOIN Senior_Manager ON company.company_code = Senior_Manager.company_code 
    JOIN Manager ON company.company_code = Manager.company_code 
    JOIN Employee ON company.company_code = Employee.company_code 
GROUP BY company.company_code, company.founder 
ORDER BY company.company_code;