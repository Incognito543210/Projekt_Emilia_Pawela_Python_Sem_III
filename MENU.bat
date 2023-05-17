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
echo 1 - Uruchom program tanie podró¿e
echo 2 - Informacje 
echo 3 - Kopia zapsaowa
echo 4 - Zakoñczenie dzia³ania programu
echo Wybierz jedn¹ z powy¿szych opcji:

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
echo Obliczenia oraz raport zosta³y utworzone. Raport zostanie otwarty. Naciœnij "ENTER" aby powróciæ do menu.
Raport.html
pause
goto menu


:info
echo Autor: Emilia Pawela
echo Opis projektu:
echo Pasa¿erowie autokarów turystycznych, przewo¿¹cych wycieczki transkontynentaln¹ autostrad¹, spêdzaj¹ w drodze wiele dni, zatem op³aty za noclegi stanowi¹ powa¿n¹ czêœæ kosztów podró¿y. Ze wzglêdu na bezpieczeñstwo jazdy i wygodê pasa¿erów ka¿dy autokar jedzie tylko w ci¹gu dnia i nie mo¿e przejechaæ wiêcej ni¿ 800 km dziennie. Noce na trasie (poza jej pocz¹tkiem i koñcem) pasa¿erowie i kierowca spêdzaj¹ w hotelach. Dotychczas planowano przejazdy tak, by liczba noclegów na trasie by³a jak najmniejsza. D¹¿¹c do obni¿ki kosztów, przedsiêbiorstwo przewozowe zdecydowa³o zbadaæ, czy op³aci siê uk³adanie planów podró¿y tak, by suma op³at za noclegi by³a mo¿liwie najni¿sza, nawet gdyby to mia³o przed³u¿yæ podró¿. W tych obliczeniach mo¿na korzystaæ z ofert hoteli po³o¿onych przy autostradzie. W ka¿dej ofercie jest podana odleg³oœæ hotelu od pocz¹tku trasy i cena jednego noclegu jednej osoby. Podró¿ jest tylko w jedn¹ stronê. Trasa nie ma rozga³êzieñ. Przez ka¿dy punkt trasy autokar przeje¿d¿a jeden raz. Nigdzie na trasie nie ma dwóch hoteli w jednym punkcie, wiêc dla zidentyfikowania hotelu wystarczy podaæ jego odleg³oœæ od pocz¹tku trasy. Nie planuje siê noclegu na pocz¹tku ani na koñcu trasy. Liczba osób w autobusie nie zmienia siê i w ka¿dym hotelu wszyscy (³¹cznie z kierowc¹) p³ac¹ za nocleg jednakowo - zgodnie z ofert¹. Pojemnoœæ hoteli jest na tyle du¿a, ¿e nie istnieje problem braku miejsc. Zawsze mo¿na liczyæ na to, ¿e w dowolnej chwili w ka¿dym hotelu bêdzie wystarczaj¹co du¿o wolnych miejsc, by przenocowaæ wszystkich pasa¿erów autobusu. Na ka¿dym odcinku trasy o d³ugoœci 800 km jest przynajmniej jeden hotel, co oznacza, ¿e przejechanie trasy z zachowaniem podanych wy¿ej warunków jest mo¿liwe. Nale¿y obliczyæ trase najszybsza z najmniejsza iloœci¹ noclegów oraz trase najtañsz¹ z najmniejszym kosztem za noclegi.
echo Naciœny "ENTER" aby powróciæ do menu.
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
echo Kopia zapasowa zosta³a wykonana, naciœny "ENTER" aby powróciæ do menu.
pause
goto menu



:koniec
echo Zakoñczono program, naciœni "ENTER" aby wyjœæ.                                                                                                                         
pause