import os
from heapq import heappop, heappush, heapify
dane1=[]
sciezka_do_folderu="input"
lista_plikow=os.listdir(sciezka_do_folderu)
for plik in range (len(lista_plikow)):
    dane1 = []
    try:
        #otworzenie pliku input i wczytanie danych do tablicy
        f = open('input/'+lista_plikow[plik], "r")
        for line in f:
            line_split=line.split()
            line_split[1]=int(line_split[1])
            line_split[0]=int(line_split[0])
            dane1.append(line_split)
        f.close()
        #dodanie punktu 0,0 do tablicy
        dane1.append([0,0])
        #posortowanie danych w tablicy
        dane1.sort()

    except (IndexError, ValueError):
        f = open("output/out" + str(lista_plikow[plik]), "w")
        f.write("Bład wprowadzanych danych")
        f.close()
        continue
    #Algorytm wyliczenia najmniejszej ilosci noclegow

    czyBlad = False
    for x in range(len(dane1) - 1):
        if (dane1[x + 1][0] - dane1[x][0] > 800):
            czyBlad=True

    if(czyBlad):
        f = open("output/out" + str(lista_plikow[plik]), "w")
        f.write("Bład wprowadzanych danych")
        f.close()
        continue

    def projekt_ilosc(dane):
        #wypelnienie tablicy poprzednikow oraz ilosci noclegow
        nastepny=[-1]*(len(dane))
        iloscNoclegow=[float('inf')]*(len(dane))
        Q=[]
        wyborNajmniejszego=[]
        wierzcholkiWyboru=[]
        #Zainicjowanie aby punkt ostatni mial nastepce 0 oraz ilosc noclegow 0
        nastepny[len(dane)-1]=0
        iloscNoclegow[len(dane)-1]=0
        #Dodanie wierzcholkow wraz z ich ilosciami noclegow do kolejki priorytetowej
        for v in range(len(dane)):
            heappush(wyborNajmniejszego,(iloscNoclegow[v],v))
        #utworzenie listy wierzcholkow znajdujacych sie w kolejce priorytetowej
        wierzcholkiWyboru=[v[1]for v in wyborNajmniejszego]

        #wykonywanie porownan dopoki punkt poczakowy nie zostanie rozpatrzony
        while 0 not in Q:
            heapify(wyborNajmniejszego)
            #pobranie najmniejszego elementu
            u = heappop(wyborNajmniejszego)[1]
            #usuniecie najmniejszego elementu z wierzcholkow i dodanie do rozpatrzonych
            Q.append(u)
            wierzcholkiWyboru.remove(u)
            wierzcholkiWyboru = [v[1] for v in wyborNajmniejszego]
            #Obliczenie odleglosci od wierzcholka, ktora nie moze byc wieksza niz 800 km
            odleglosc=dane[u][0]-800
            for v in range(len(dane)):
                w=dane[v][0]
                if w < odleglosc and odleglosc!= dane[u][0]:
                    continue
                if v not in Q:
                    #Porowanie czy aktalna ilosc noclegow jest bardziej oplacalna
                    if iloscNoclegow[v]>iloscNoclegow[u]+1:
                        nastepny[v]=u
                        iloscNoclegow[v]=iloscNoclegow[u]+1
                        wyborNajmniejszego[wierzcholkiWyboru.index(v)]=(iloscNoclegow[v],v)
                        heapify(wyborNajmniejszego)
        V=[]
        i=0
        #Dodanie do V wierzcholkow ktore obejmuja najmniejsza trase
        while len(dane)-1 not in V:
            V.append(nastepny[i])
            i=nastepny[i]
        V.remove(len(dane)-1)
        wyjscie = ""
        #Polaczenie tych wierzcholkow w jeden string
        for a in range(len(V)):
            wyjscie += str(dane[V[a]][0]) + " "
        return wyjscie


    #Algorytm wyliczenia najtanszej podrozy, jest analogoiczny do pozyzszego, jedyna roznica jest to ze przy porownaniu
    # jest rozpatrywana cena, a nie ilosc nocy
    def projekt_cena(dane):
        nastepny=[-1]*(len(dane))
        cenaNoclegow=[float('inf')]*(len(dane))
        Q=[]
        wyborNajmniejszej=[]
        wierzcholkiWyboru=[]
        nastepny[len(dane)-1]=0
        cenaNoclegow[len(dane)-1]=0
        for v in range(len(dane)):
            heappush(wyborNajmniejszej,(cenaNoclegow[v],v))
        wierzcholkiWyboru=[v[1]for v in wyborNajmniejszej]

        while 0 not in Q:
            heapify(wyborNajmniejszej)
            u = heappop(wyborNajmniejszej)[1]
            Q.append(u)
            wierzcholkiWyboru.remove(u)
            wierzcholkiWyboru = [v[1] for v in wyborNajmniejszej]
            odleglosc=dane[u][0]-800
            for v in range(len(dane)):
                w=dane[v][0]
                if w < odleglosc and odleglosc!= dane[u][0]:
                    continue
                if v not in Q:
                    #Przypisanie zmiennej cena wartości dane od v i 1
                    cena=dane[v][1]
                    if cenaNoclegow[v]>cenaNoclegow[u]+cena:
                        nastepny[v]=u
                        cenaNoclegow[v]=cenaNoclegow[u]+cena
                        wyborNajmniejszej[wierzcholkiWyboru.index(v)]=(cenaNoclegow[v],v)
                        heapify(wyborNajmniejszej)
        V=[]
        i=0
        while len(dane)-1 not in V:
            V.append(nastepny[i])
            i=nastepny[i]
        V.remove(len(dane)-1)
        wyjscie=""
        for a in range(len(V)):
            wyjscie+=str(dane[V[a]][0]) +" "
        return wyjscie


    #zapisanie danych do pliku wyjsciowego
    f=open("output/out"+str(lista_plikow[plik]), "w")
    f.write(projekt_ilosc(dane1)+"\n")
    f.write(projekt_cena(dane1))
    f.close()