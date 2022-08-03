# Bosluksuz_MelSpectrogram_Cikar

Sadece matlab da var olan melSpectrogram çalıştırıldığında

ses_dosyasi_adi = '/home/muhammed/Desktop/Mel_Kırp/sample/si1058.wav';
mel_dosyasi_adresi = '/home/muhammed/Desktop/Mel_Kırp/sample/MelSpectrogram_no_axis.png';
[audioIn,fs] = audioread(ses_dosyasi_adi);
f=figure('Visible','off');
melSpectrogram(audioIn,fs);
saveas(gcf,mel_dosyasi_adresi);

![MelSpectrogram_original](https://user-images.githubusercontent.com/33607770/182579731-0b46eb3e-825c-49b9-a5e1-c5cec3fbd365.png)
