import os
import datetime

#utworzenie raportu html
f_html=open("Raport.html","w")

#Utworzenie tytulu, dodanie koloru i wzoru tabelki
html_raport="""
<html>
<style>table, th, td {
  border: 3px solid black;
  border-collapse: collapse;
}
th, td {
  background-color: #96D4D4;
}</style>
<head>
<link rel="stylesheet" href="style.css" />
<title>Raport</title>
</head>
<body>
<h2>Raport z działania programu Tanie podróże z dnia """
html_raport+=str(datetime.datetime.now())
html_raport+="</h2>"


html_raport+="<p>"
sciezka_do_folderu="input"
lista_plikow=os.listdir(sciezka_do_folderu)

#utworzenie tabelki
html_raport+="""<table align="center"><tr>"""
#tutul dla tabelki input
for j in range (len(lista_plikow)):
    html_raport+="<th>Input</th>"
html_raport+="</tr>"

#input
html_raport+="<tr>"
for plik in range (len(lista_plikow)):
    dane=""
    html_raport += "<td>"
    #otworzenie pliku input i wczytanie danych do tablicy
    f = open('input/'+lista_plikow[plik], "r")
    for line in f:
        html_raport+=line
        html_raport += "<br>"
    f.close()
html_raport += "</td>"
html_raport+="</tr>"

#tytul dla output
html_raport+="<tr>"
for j in range (len(lista_plikow)):
    html_raport+="<th>Output</th>"
html_raport+="</tr>"

#output
html_raport+="<tr>"
sciezka_do_folderu="output"
lista_plikow=os.listdir(sciezka_do_folderu)
for plik in range (len(lista_plikow)):
    dane=""
    #otworzenie pliku input i wczytanie danych do tablicy
    html_raport += "<td>"
    f = open('output/'+lista_plikow[plik], "r")
    for line in f:
        html_raport+=line
        html_raport+="<br>"
    f.close()

html_raport+="</td>"
html_raport+="</tr>"
html_raport+="</table>"
html_raport+="""</p>
</body>
</html>
"""
#zapisanie raportu i zamkniecie go
f_html.write(html_raport)
f_html.close()
