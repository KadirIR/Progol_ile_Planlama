% Kadir IR
% 1220505055

uye_bilgileri(murat, [kodlama, tasarim], 9, 17).
uye_bilgileri(hande, [test, tasarim], 10, 18).
uye_bilgileri(fatih, [kodlama, test], 8, 16).
uye_bilgileri(melek, [tasarim, test], 11, 19).

gorev_bilgileri(kodlama, [kodlama], 4).
gorev_bilgileri(tasarim, [tasarim], 3).
gorev_bilgileri(test, [test], 5).
gorev_bilgileri(entegrasyon, [kodlama, tasarim], 6).
gorev_bilgileri(debug, [kodlama, test], 5).

gorev_baglantisi(kodlama, entegrasyon).
gorev_baglantisi(tasarim, test).
gorev_baglantisi(test, debug).

atanabilir_gorev(Gorev, Uye, Baslangic, Bitis) :-
    gorev_bilgileri(Gorev, GerekliYetenekler, Sure),
    uye_bilgileri(Uye, Yetenekler, UygunBaslangic, UygunBitis),
    subset(GerekliYetenekler, Yetenekler),
    (var(Baslangic) -> Baslangic = UygunBaslangic; true),
    (var(Bitis) -> Bitis is Baslangic + Sure; true),
    Baslangic >= UygunBaslangic,
    Bitis =< UygunBitis.

bagimlilik_kontrolu(Gorev, Atamalar) :-
    \+ (gorev_baglantisi(BagliGorev, Gorev),
        \+ member(atanabilir_gorev(BagliGorev, _, _, _), Atamalar)).

plan_olustur([], _, []).
plan_olustur([Gorev|KalanGorevler], AtamaListesi, [atanabilir_gorev(Gorev, Uye, Baslangic, Bitis)|YeniAtamalar]) :-
    bagimlilik_kontrolu(Gorev, AtamaListesi),
    atanabilir_gorev(Gorev, Uye, Baslangic, Bitis),
    plan_olustur(KalanGorevler, [atanabilir_gorev(Gorev, Uye, Baslangic, Bitis)|AtamaListesi], YeniAtamalar).

proje_gorev_listesi(1, [tasarim, kodlama, test, debug]).
proje_gorev_listesi(2, [tasarim, kodlama, test, entegrasyon]).
proje_gorev_listesi(3, [tasarim, kodlama, test, entegrasyon, debug]).

uc_proje_plani([Proje1Plani, Proje2Plani, Proje3Plani], ToplamGun) :-
    proje_gorev_listesi(1, Proje1Gorevler),
    proje_gorev_listesi(2, Proje2Gorevler),
    proje_gorev_listesi(3, Proje3Gorevler),
    plan_olustur(Proje1Gorevler, [], Proje1Plani),
    plan_olustur(Proje2Gorevler, [], Proje2Plani),
    plan_olustur(Proje3Gorevler, [], Proje3Plani),
    findall(Bitis, (member(atanabilir_gorev(_, _, _, Bitis), Proje1Plani);
                    member(atanabilir_gorev(_, _, _, Bitis), Proje2Plani);
                    member(atanabilir_gorev(_, _, _, Bitis), Proje3Plani)), BitisZamanlari),
    max_list(BitisZamanlari, ToplamGun).
