--1."Categories" tablosundan CategoryName alanýna göre artan sýrada olacak þekilde CatogoryName ve Description bilgilerini veren sorguyu oluþturunuz.
SELECT CategoryName, Description
FROM Categories
ORDER BY CategoryName ASC

--2."Customers" tablosundan CompanyName,ContactName,"KiþiAdý, ÞirketAdý,ContactTitle ve Phone bilgilerini Phone bilgisine göre artan sýrada olacak þekilde gösteren sorguyu oluþturunuz.
SELECT CompanyName,ContactName,ContactTitle,Phone
FROM Customers
ORDER BY Phone ASC

--3."Employees" tablosundan iþe baþlama tarihi ("HireDate") alanýna göre azalan sýrada olacak þekilde FirstName ve büyük harfli olacak LastName alanlarýný arasýnda bir boþluk karakteri olmak üzere oluþturan sorguyu oluþturunuz.

SELECT HireDate,FirstName + ' ' + UPPER (LastName) AS "NameLastName"
FROM Employees
ORDER BY HireDate DESC

--4."Orders" tablosundan OrderID, OrderDate, ShippedDate, CustomerID, Freight bilgilerini Freight alanýna göre azalan sýrada olacak þekilde ilk 10 kayýdý gösteren sorguyu oluþturunuz.

SELECT OrderID,OrderDate,ShippedDate,CustomerID, Freight
FROM Orders
ORDER BY Freight DESC
Select TOP 10 * From Orders

--5. "Customers" tablosundan tüm "CustomerID" bilgilerini küçük harfle gösteren ve bunu "Kimlik Tnm" olarak yeniden adlandýran bir sorgu oluþturunuz.

SELECT + LOWER (CustomerID) AS KimlikTnm
FROM Customers 

--6. "Suppliers" tablosundan Country bilgisi azalan sýrada, CompanyName artan sýrada olacak þekilde CompanyName, Fax, Phone, Country bilgilerini döken bir sorgu oluþturunuz.

SELECT Country , Fax , Phone , CompanyName 
FROM Suppliers
ORDER BY  Country DESC, CompanyName

--7. "Customers" tablosundan yalnýzca 'Buenos Aires'ten gelen tüm müþterilerin CompanyName, ContactName'lerini gösteren bir sorgu oluþturunuz.

SELECT CompanyName, ContactName, City
FROM Customers
WHERE City = 'Buenos Aires'

--8. "Products" tablosundan stokta olmayan ürünlerin ProductName, UnitPrice, QuantityPerUnit bilgilerini gösteren bir sorgu oluþturunuz.

SELECT ProductName, UnitPrice, QuantityPerUnit, UnitsInStock
FROM Products
WHERE UnitsInStock=0

--9. Almanya, Meksika, Ýspanya'dan olmayan tüm müþterilerin(Customers) CompanyName,Address,City,Country bilgilerini gösteren bir sorgu oluþturunuz.

Select CompanyName,Address,City,Country
FROM Customers
WHERE Country NOT IN ('Germany','Mexico','Spain')

--10. 21 Mayýs 1996'da verilen tüm sipariþlerin OrderDate,ShippedDate, CustomerID ve Freight bilgilerini gösteren bir sorgu oluþturunuz.

SELECT OrderDate,ShippedDate, CustomerID,Freight
FROM Orders
WHERE OrderDate = 1996-05-21

--11. Amerika Birleþik Devletleri'nden olmayan çalýþanlarýn FirstName,LastName,Country bilgilerini gösteren bir sorgu oluþturunuz.

SELECT FirstName,LastName,Country
FROM Employees
WHERE Country NOT IN ('USA')

--13. Baþ harfi A veya B ile baþlayan þehirlerdeki müþterilerin City, CompanyName, ContactName bilgilerini gösteren bir sorgu oluþturunuz.

SELECT City,CompanyName,ContactName
FROM Customers
WHERE City LIKE '[AB]%';

--14. Navlun(Freight) maliyetinin 500 dolardan fazla olduðu tüm sipariþleri(Orders) gösteren bir sorgu oluþturunuz.

SELECT Freight
FROM ORDERS
WHERE Freight > 500

--15. Faks numarasý olmayan tüm müþterilerin CompanyName, ContactName bilgilerini gösteren bir sorgu oluþturunuz.

SELECT CompanyName,ContactName
FROM Customers
WHERE Fax IS NULL

--16. Kimseye rapor vermeyen(ReportsTo alaný) çalýþanlarýn FirstName, LastName bilgilerini gösteren bir sorgu oluþturunuz.

SELECT  FirstName,LastName
FROM Employees
WHERE ReportsTo IS NULL

--17. Adýnda L harfi olan þehirlerdeki müþterilerin City,CompanyName,ContactName bilgilerini ContactName bilgisi azalacak þekilde gösteren bir sorgu oluþturunuz.

SELECT City,CompanyName,ContactName
FROM Customers
WHERE City LIKE '%L%'
ORDER BY ContactName DESC


--18. 1950'lerde doðan çalýþanlarýn(Employee tablosu) FirstName, LastName, BirthDate bilgilerini gösteren bir sorgu oluþturunuz.

SELECT FirstName,LastName,BirthDate
FROM Employees
WHERE BirthDate LIKE '%195%'

--19. Exotic Liquids, Specialty Biscuits Ltd., Escargots Nouveaux tedarikçileri tarafýndan saðlanan tüm ürünlerin tedarikçi kimliðine göre sýralanmýþ olarak SupplierID, ProductName ve CompanyName bilgilerini gösteren sorgu oluþturunuz.

--HANGÝ TABLO BULAMADIM

--20. "Seattle" þehrindeki çalýþanlarýn LastName,FirstName bilgilerini gösteren bir sorgu oluþturunuz

SELECT LastName,FirstName
FROM Employees
WHERE City = 'Seattle'

--21. Madrid dýþýnda Meksika'daki herhangi bir þehirdeki veya Ýspanya'daki diðer þehirlerdeki tüm müþterilerin CompanyName,ContactName, City ve Country bilgilerini gösteren bir sorgu oluþturunuz.

SELECT CompanyName,ContactName,City,Country
FROM Customers
WHERE City! = 'Madrid' and Country ='Spain' or Country ='Mexico'


--22.Ýkinci karakterinde A harfi olmayan tüm müþterilerin ContactName bilgisini azalan sýrada gösteren bir sorgu oluþturunuz.

SELECT ContactName
FROM Customers
WHERE ContactName NOT LIKE '_A%'
ORDER BY ContactName DESC

--23. Orders tablosundan Freight toplamý 200$'dan büyük olan bilgilerin CustomerID ve Freight toplamýný gösteren bir sorgu oluþturunuz.(ÝPUCU: GroupBy ve Having deyimi kullanmanýz gerekecek.)

SELECT AVG(Freight) AS 'Nakliye Toplamý' 
FROM Orders 
GROUP BY CustomerID 
HAVING MAX(Freight)>200;

--24. Çalýþanlar tablosundan Çalýþan Kimliði, çalýþanýn Soyadý ve Adý ve yönetici olarak rapor verdikleri kiþinin Soyadý ve Adý'ný gösteren bir sorgu oluþturunuz. (ÝPÝNUCU : Self Join)

SELECT EmployeeID,FirstName,LastName
FROM Employees
--INNER JOIN Employees
--ON Yönetici adýný bulamadým = EmployeeID;

--25. Tüm ürünlerin(Products) BirimFiyatýný(UnitPrice) ortalama(AVG), minimum(MIN) ve maksimum(MAX) deðerlerini OrtalamaFiyat, MinimumFiyat,MaksimumFiyat olarak gösteren bir sorgu oluþturunuz.

SELECT AVG(UnitPrice) AS 'ORTALAMA' FROM Products 
SELECT MAX(UnitPrice) AS 'MAXIMUM' FROM Products  
SELECT MIN(UnitPrice) AS 'MINIMUM' FROM Products 

--26. "Categories" tablosundan CategoryName bilgisinin ilk 5 karakterini getiren(LEFT fonksiyonu) ve KýsaBilgi olarak yeniden adlandýrýlan bir sorgu oluþturunuz.

SELECT LEFT(CategoryName,5) as 'KISA BÝLGÝ' FROM Categories 

--27. Deniz ürünleri kategorisindeki tüm ürünlerden ÞirketAdý ve ÜrünAdýný listeleyen bir sorgu oluþturunuz.

SELECT CompanyName, ProductName
FROM Products 
INNER JOIN Categories C ON CategoryID = CategoryID
INNER JOIN Suppliers ON SupplierID = SupplierID
WHERE CategoryName = 'Seafood';

--28. CategoryID'si 5 olan tüm ürünlerden CategoryID, CompanyName ve ProductName bilgilerini listeleyen bir sorgu oluþturunuz.
SELECT CompanyName, ProductName
FROM Products 
INNER JOIN Categories C ON CategoryID = CategoryID
INNER JOIN Suppliers ON SupplierID = SupplierID
WHERE CategoryName = 'Grains/Cereals';

--29. ContactTitle alanýnda 'Owner' geçen müþterilerimin þirket adlarýný listeleyiniz.

--30. 50$ ile 100$ arasýnda bulunan tüm ürünlerin adlarý ve fiyatlarýný listeleyiniz.

--31. 1 temmuz 1996 ile 31 Aralýk 1996 tarihleri arasýndaki sipariþlerin (Orders), SipariþID (OrderID) ve SipariþTarihi (OrderDate) bilgilerini listeleyiniz.

--32. 1997 yýlýna ait satýþlarý(Orders) listeleyiniz.

--33. 1997 Ocak ayýna ait Londra ve Fransaya yapýlan satýþlarý listeleyiniz.

--34. 1955-1963 yýllarý arasýnda doðmuþ olan 3 Amerikalý olmayan çalýþaný listeleyiniz.(Employee tablosu)

--35. 1997 yýlýnýn ilk 6 ayýnda Londra ya yapýlan satýþlarý listeleyiniz.

--36. 1998 yýlýnda gönderilemeyen sipariþleri görüntüleyiniz.(Orders)

--37. Deniz ürünlerinden ve stoklarda 15 ten çok olan ürünleri gösteriniz.

--38. Ülkesi (Country) Spain veya France veya Germany olan müþterileri listeleyiniz.

SELECT CustomerName
FROM Customers
WHERE Country IN ('Germany','France', 'Spain');

--39. Ülkesi (Country) Spain veya France veya Germany olmayan müþterileri listeleyiniz.

SELECT CustomerName
FROM Customers
WHERE Country NOT IN ('Germany','France', 'Spain');

--40. Amerika’da yaþamayan çalýþanlarý listeleyiniz.

	SELECT EmployeesName
	FROM Employees
	WHERE Country NOT IN ('USA')

--41. En Pahalý 5 ürünü listeleyiniz.

--42. 1996 yýlýnýn 12 ayýnda yapýlan satýþlardan nakliye(freight) ücretlerinden en pahalý 3 tanesini gösteriniz

--43. Ürünlerimi en pahalýdan en ucuza doðru sýralasýn, ama stoklarýný küçükten-büyüðe doðru göstersin sonuç olarak ürün adý ve fiyatýný göstersin

--44. 1 Numaralý kategoride kaç ürün vardýr.

--45. Kaç farklý ülkeye satýþ yapýlmaktadýr. Bunlarý listeleyiniz.

--46. Tüm ciro miktarý ne kadardýr?

--47. Ortalama Ürün Fiyatý nedir?

--48. En pahalý ürünün adý ve fiyatý nedir?

--49. En ucuz ürünün adý ve fiyatý nedir?

--50. En az kazandýran sipariþin tutarý nedir?

--51. Hangi ürün kategorisinde kaç adet ürün vardýr. Ýsimleriyle ve adetleriyle birlikte belirtiniz.

--52. 500 adetden fazla satýlan ürünler nedir?

--53. Hangi sipariþi hangi müþteri vermiþ?

--54. En fazla sipariþ alan çalýþaným kimdir?



