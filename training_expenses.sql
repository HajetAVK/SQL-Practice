/*
 * Бизнес-задача:
 * Определить, какие члены команды и в какой роли понесли расходы, 
 * связанные с обучением и мероприятиями (Training/Events).
 * Вывести: роль, имя, сумму затрат.
 *
 * Логика решения:
 * 1. Пришлось соединить 4 таблицы (Expenses -> TeamMembers -> ProjectResources -> ResourceTypeCategories).
 * 2. Используем INNER JOIN, чтобы отсечь расходы без категорий и без привязки к сотрудникам.
 * 3. Фильтруем категорию по названию 'Training/Events'.
 * 4. Считаем сумму затрат как количество * цену за единицу.
 * 5. Группируем по роли и имени.
 */

SELECT 
    role, 
    member_name, 
    SUM(amount * unit_cost) AS event_expenses
FROM Expenses 
JOIN TeamMembers ON Expenses.team_member = TeamMembers.member_id
JOIN ProjectResources ON Expenses.resource_id = ProjectResources.resource_id
JOIN ResourceTypeCategories ON ProjectResources.category_id = ResourceTypeCategories.category_id
WHERE category_name = 'Training/Events'
GROUP BY role, member_name;
