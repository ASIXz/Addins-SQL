/*1. Вывести список работников, зарплата которых ниже 300 $ и которые работают во Львове.*/
SELECT FirstName, LastName
FROM [Empl] Join [Debt] on ([Debt].[Id] = [Empl].[DeptId])
Where (Salary < 300) And (City = 'Lviv');
/*2. Вывести список имен работников (без повторов, упорядочен по алфавиту).*/
SELECT DISTINCT [FirstName]
FROM [Empl]
ORDER BY [FirstName] ASC;
/*3. Посчитать сколько работников у компании.*/
SELECT COUNT([Id]) AS 'COUNT'
FROM [Empl];
/*4. Получить список количества работников в подразделении № 5.*/
SELECT COUNT([Id]) AS 'COUNT'
FROM [Empl]
WHERE [Empl].DeptId = 5;
/*5. Получить список количества работников в каждом подразделении.*/
SELECT  [DeptId] AS 'No of Debt', COUNT([Id]) AS 'COUNT'
FROM [Empl]
GROUP BY [DeptId];
/*6. Выберите список городов, содержащие букву 'Л' в начале слова.*/
SELECT [City]
FROM [Debt]
WHERE [City] Like 'L%';
/*7. Выберите список всех городов, содержащие букву 'ь'(a) в середине слова и количество работников более 20(2).*/
SELECT [City]
FROM [Empl] Join [Debt] on ([Debt].[Id] = [Empl].[DeptId])
WHERE [City] Like '%a%'
GROUP BY [City]
HAVING COUNT(Empl.Id) > 2;
/*8. Выберите список людей, имеющих однофамильцев.*/
SELECT *
FROM [Empl]
WHERE [LastName] IN
(SELECT  [LastName]
FROM [Empl]
GROUP BY [LastName]
HAVING COUNT([Id]) > 2)
ORDER BY LastName, FirstName;
/*9. Выберите список людей, имеющих несколько полных совпадений имени и фамилии, которые, к тому же, работают в городе 'Львов'(Lviv).*/
SELECT *
FROM [Empl] Join [Debt] on ([Debt].[Id] = [Empl].[DeptId])
WHERE [LastName]+[FirstName] IN
(SELECT  [LastName]+[FirstName]
FROM [Empl] 
GROUP BY [LastName], [FirstName]
HAVING COUNT([Empl].[Id]) > 2) and [City] = 'Lviv'
ORDER BY FirstName, LastName;
/*10. Получить список городов с количеством работников с именем 'Иван'('Ivan') более 10(2).*/
SELECT [City]
FROM [Empl] Join [Debt] on ([Debt].[Id] = [Empl].[DeptId])
WHERE [FirstName] = 'Ivan'
GROUP BY [City]
HAVING COUNT(Empl.Id) > 2;
/*11. Получить список работников с фамилией, начинающейся на букву А.*/
SELECT *
FROM [Empl]
WHERE [LastName] Like 'A%';
/*12. Получить список работников с заработной платой выше 400 $.*/
SELECT *
FROM [Empl]
WHERE [Salary] > 400;
/*13. Получить средний размер заработной платы на фирме.*/
SELECT AVG([Salary])
FROM [Empl];
/*14. Получить список сотрудников, получающих заработную плату в диапазоне от 200 до 400 $.*/
SELECT *
FROM [Empl]
WHERE [Salary] Between 200 And 400
ORDER BY [Salary];
/*15. Вывести “id” подразделения, в котором сотрудники получают максимальную заработную плату.*/
SELECT TOP 1 [Debt].[Id]
FROM [Empl] Join [Debt] on ([Debt].[Id] = [Empl].[DeptId])
GROUP BY [Debt].[Id]
ORDER BY AVG([Salary]) DESC;