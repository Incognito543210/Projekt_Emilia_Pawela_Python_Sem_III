@echo off & @chcp 1250>nul

:menu
cls
echo  _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ 
echo ^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|___[]^|_____^|_____^|_____^|_____^|_____^|
echo       __/\____/\____/\_^|_   _^|_ _ _ __ (_) ___  ^|  _ \ ___   __^| ^|_ __ /_/ _________/\____/\____/\__         
echo  _____\    /\    /\    / ^| ^|/ _` ^| '_ \^| ^|/ _ \ ^| ^|_) / _ \ / _` ^| '__/ _ \_  / _ \    /\    /\    /_____    
echo ^|_____/_  _\/_  _\/_  _\ ^| ^| (_^| ^| ^| ^| ^| ^|  __/ ^|  __/ (_) ^| (_^| ^| ^| ^| (_) / /  __/_  _\/_  _\/_  _\_____^|   
echo         \/    \/    \/   ^|_^|\__,_^|_^| ^|_^|_^|\___^| ^|_^|   \___/ \__,_^|_^|  \___/___\___^| \/    \/    \/           
echo  _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ 
echo ^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|
echo MENU
echo 1 - Uruchom program tanie podr�e
echo 2 - Informacje 
echo 3 - Kopia zapsaowa
echo 4 - Zako�czenie dzia�ania programu
echo Wybierz jedn� z powy�szych opcji:

set /p wybor=

if %wybor%==1 ( goto Start )
if %wybor%==2 ( goto info )
if %wybor%==3 ( goto kopia )
if %wybor%==4 ( goto koniec )


:Start

cd output
del *.txt
cd ../
taniePodroze.py
echo Wykonano obliczenia...
Raport.py
echo Wykonano raport...
echo Obliczenia oraz raport zosta�y utworzone. Raport zostanie otwarty. Naci�nij "ENTER" aby powr�ci� do menu.
Raport.html
pause
goto menu


:info
echo Autor: Emilia Pawela
echo Opis projektu:
echo Pasa�erowie autokar�w turystycznych, przewo��cych wycieczki transkontynentaln� autostrad�, sp�dzaj� w drodze wiele dni, zatem op�aty za noclegi stanowi� powa�n� cz�� koszt�w podr�y. Ze wzgl�du na bezpiecze�stwo jazdy i wygod� pasa�er�w ka�dy autokar jedzie tylko w ci�gu dnia i nie mo�e przejecha� wi�cej ni� 800 km dziennie. Noce na trasie (poza jej pocz�tkiem i ko�cem) pasa�erowie i kierowca sp�dzaj� w hotelach. Dotychczas planowano przejazdy tak, by liczba nocleg�w na trasie by�a jak najmniejsza. D���c do obni�ki koszt�w, przedsi�biorstwo przewozowe zdecydowa�o zbada�, czy op�aci si� uk�adanie plan�w podr�y tak, by suma op�at za noclegi by�a mo�liwie najni�sza, nawet gdyby to mia�o przed�u�y� podr�. W tych obliczeniach mo�na korzysta� z ofert hoteli po�o�onych przy autostradzie. W ka�dej ofercie jest podana odleg�o�� hotelu od pocz�tku trasy i cena jednego noclegu jednej osoby. Podr� jest tylko w jedn� stron�. Trasa nie ma rozga��zie�. Przez ka�dy punkt trasy autokar przeje�d�a jeden raz. Nigdzie na trasie nie ma dw�ch hoteli w jednym punkcie, wi�c dla zidentyfikowania hotelu wystarczy poda� jego odleg�o�� od pocz�tku trasy. Nie planuje si� noclegu na pocz�tku ani na ko�cu trasy. Liczba os�b w autobusie nie zmienia si� i w ka�dym hotelu wszyscy (��cznie z kierowc�) p�ac� za nocleg jednakowo - zgodnie z ofert�. Pojemno�� hoteli jest na tyle du�a, �e nie istnieje problem braku miejsc. Zawsze mo�na liczy� na to, �e w dowolnej chwili w ka�dym hotelu b�dzie wystarczaj�co du�o wolnych miejsc, by przenocowa� wszystkich pasa�er�w autobusu. Na ka�dym odcinku trasy o d�ugo�ci 800 km jest przynajmniej jeden hotel, co oznacza, �e przejechanie trasy z zachowaniem podanych wy�ej warunk�w jest mo�liwe. Nale�y obliczy� trase najszybsza z najmniejsza ilo�ci� nocleg�w oraz trase najta�sz� z najmniejszym kosztem za noclegi.
echo Naci�ny "ENTER" aby powr�ci� do menu.
pause
goto menu


:kopia

for /f %%a in ('powershell -Command "Get-Date -format yyyy_MM_dd__HH_mm_ss"') do set datatime=%%a
if not exist "backup" mkdir backup
cd backup
mkdir "%datatime%"
cd %datatime%
mkdir input
mkdir output
cd ../
cd ../
xcopy /s input backup\"%datatime%"\input
xcopy /s output backup\"%datatime%"\output
xcopy Raport.html backup\"%datatime%"
xcopy style.css backup\"%datatime%"
echo Kopia zapasowa zosta�a wykonana, naci�ny "ENTER" aby powr�ci� do menu.
pause
goto menu



:koniec
echo Zako�czono program, naci�ni "ENTER" aby wyj��.                                                                                                                         
pause