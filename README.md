# Prolog ile Proje Planlama

Bu proje, **Prolog** kullanarak bir proje için görev atama ve planlama yapmayı sağlar. Üyelerin yetenekleri, uygun zamanları ve görevlerin gereksinimleri göz önünde bulundurularak otomatik bir görev planı oluşturulabilir.

## 📌 Özellikler
- Üyelerin yetenekleri ve uygun zaman dilimleri tanımlanabilir.
- Görevlerin yetenek gereksinimleri ve süreleri belirlenebilir.
- Görevler arasındaki bağımlılıklar tanımlanabilir.
- Proje için görev atamaları otomatik olarak hesaplanır.
- Üç farklı proje için görev planlaması yapılabilir.

## 🚀 Kullanım
Prolog ortamında aşağıdaki sorguyu çalıştırarak üç farklı proje için görev planlamasını oluşturabilirsiniz:

```prolog
?- uc_proje_plani([Proje1Plani, Proje2Plani, Proje3Plani], ToplamGun).
```

Örnek çıktı:
```
Proje1Plani = [...],
Proje2Plani = [...],
Proje3Plani = [...],
ToplamGun = 19.
```

## 🛠 Gereksinimler
- **SWI-Prolog** veya başka bir Prolog yorumlayıcısı
