#! /bin/bash
while true 
do
GREP=/bin/grep
dosyaYukle()
{
  touch data
  echo "Data dosyası oluşturuldu." 
  echo "" 
  cat -n data
  sleep 5
}
satirEkle()
{    
  echo ""
  cat -n data
  echo ""
  echo "Dosyaya eklemek istediklerinizi giriniz:";
  read yeni
  echo $yeni >> data
  echo $yeni" yeni satıra eklendi."    
  echo ""
  cat -n data
  sleep 5
}
satirDuzenle()
{
  echo ""
  cat -n data
  echo ""
  echo "Değiştirmek istediğiniz satır numarasını giriniz: "
  read silinen
  sed -i $silinen"d" data  
  echo "Değişikliği yapınız:";
  read yeni
  echo $yeni >> data
  echo ""
  echo "Satır"$silinen"," $yeni","" olarak değiştirildi ve dosyanın en altına eklendi."
  echo ""
  cat -n data  
  sleep 5
}
kelimeDuzenle()
{
  echo ""
  cat -n data
  echo ""
  echo "Değiştirmek istediğiniz kelimeyi giriniz: "
  read eskikelime  
  echo "Değişikliği yapınız:  "
  read yenikelime
  sed -i 's/'$eskikelime'/'$yenikelime'/g' data
  echo ""
  cat -n data  
  sleep 5
}
satirSil()
{
  echo ""
  cat -n data
  echo ""
  echo "Silinecek satır numarasını giriniz: "
  read silinen
  sed -i ""$silinen"d" data
  echo ""
  cat -n data 
  sleep 5
}
clear
echo "   ** MENU **"
echo ""
echo "1. Dosyayı Yükle"
echo "2. Satır Düzenle"
echo "3. Satır Sil"
echo "4. Satır Ekle"
echo "5. Kelime Düzenle"
echo "6. Çıkış"
echo ""
echo "Yapmak istediğiniz işlemi seçiniz: "
read islem
case "$islem" in
  1) dosyaYukle;;
  2) satirDuzenle;;
  3) satirSil;;
  4) satirEkle;;
  5) kelimeDuzenle;;
  6) exit;;
esac
sleep 2
done