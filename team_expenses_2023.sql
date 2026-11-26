/*
 * Бизнес-задача: 
 * Определить, сколько потратил каждый член команды в 2023 году. 
 * Исключить из отчета тех, кто не совершал трат.
 * Отсортировать по сумме затрат.
 *
 * Логика:
 * 1. INNER JOIN отсекает тех, у кого нет записей в таблице Expenses.
 * 2. Считаем сумму через SUM(amount * unit_cost).
 * 3. Фильтруем по 2023 году.
 * 4. Группируем по имени и роли.
 */

SELECT 
    member_name, 
    role, 
    SUM(amount * unit_cost) AS total_expenses
FROM Expenses 
JOIN TeamMembers ON Expenses.team_member = TeamMembers.member_id
WHERE YEAR(Expenses.date) = 2023
GROUP BY member_name, role
ORDER BY 3;
