
SELECT
EmployeeKey,
FirstName+' '+LastName,
CASE
WHEN Gender = 'M' THEn '1'
ELSE '0'
END
FROM
ContosoRetailDW.dbo.DimEmployee
----
----
update OKAYCHAMP.dbo.AMIGO
SET NAME = 'DAVI'
WHERE ID = 1
--
--
INSERT INTO AMIGO(ID, NAME, OK)
SELECT
EmployeeKey,
FirstName+' '+LastName,
CASE
WHEN Gender = 'M' THEn '1',
ELSE '0'
END
FROM
ContosoRetailDW.dbo.DimEmployee
---
---
DELETE
FROM PRODUTOS
WHERE ID_PRODUTO = 3