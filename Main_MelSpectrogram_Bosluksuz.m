clear
clc
ses_dosyasi_adi = '/home/muhammed/Desktop/Mel_Kırp/sample/si1058.wav';
mel_dosyasi_adresi = '/home/muhammed/Desktop/Mel_Kırp/sample/MelSpectrogram.png';

f=figure('Visible','off');
f.Position(3:4) = [875 655];
sonuc = MelSpectrogram_Bosluksuz(ses_dosyasi_adi, f);
imwrite(sonuc,mel_dosyasi_adresi);
disp('İşlem Tamamlandı');
