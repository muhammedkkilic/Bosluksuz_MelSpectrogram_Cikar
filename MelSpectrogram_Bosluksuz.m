function sonuc = MelSpectrogram_Bosluksuz(ses_dosyasi_yolu, figure)
   f = figure;
   [audioIn,fs] = audioread(ses_dosyasi_yolu);
   melSpectrogram(audioIn,fs);
   axis off
   colorbar off
   F = getframe(gcf);
   [X, ~] = frame2im(F);
   renkli = uint8(X);
   renksiz = rgb2gray(uint8(X));
   kenar_bosluklari = renksiz(1,1);
   matching_indices = renksiz == kenar_bosluklari;

   renksiz(matching_indices) = 0;

   birinci_indis_HEIGHT = -1;
   ikinci_indis_HEIGHT = -1;
   birinci_indis_WIDTH = -1;
   ikinci_indis_WIDTH = -1;
   birinci_indis_HEIGHT_bulundu = false;
   ikinci_indis_HEIGHT_bulundu = false;
   birinci_indis_WIDTH_bulundu = false;
   ikinci_indis_WIDTH_bulundu = false;

   for a=1:size(renksiz,1)
       toplam1 = sum(renksiz(a,:));
       if birinci_indis_HEIGHT_bulundu == false && toplam1 ~= 0
           birinci_indis_HEIGHT = a;
           birinci_indis_HEIGHT_bulundu = true;
       end
       toplam2 = sum(renksiz(size(renksiz,1) - a + 1,:));
       if ikinci_indis_HEIGHT_bulundu == false && toplam2 ~= 0
           ikinci_indis_HEIGHT = size(renksiz,1) - a + 1;
           ikinci_indis_HEIGHT_bulundu = true;
       end
       if birinci_indis_HEIGHT_bulundu == true && ikinci_indis_HEIGHT_bulundu == true
           break;
       end
   end
   for a=1:size(renksiz,2)
       toplam1 = sum(renksiz(:,a));
       if birinci_indis_WIDTH_bulundu == false && toplam1 ~= 0
           birinci_indis_WIDTH = a;
           birinci_indis_WIDTH_bulundu = true;
       end
       toplam2 = sum(renksiz(:,size(renksiz,2) - a + 1));
       if ikinci_indis_WIDTH_bulundu == false && toplam2 ~= 0
           ikinci_indis_WIDTH = size(renksiz,2) - a + 1;
           ikinci_indis_WIDTH_bulundu = true;
       end
       if birinci_indis_WIDTH_bulundu == true && ikinci_indis_WIDTH_bulundu == true
           break;
       end
   end
   sonuc = renkli(birinci_indis_HEIGHT:ikinci_indis_HEIGHT,birinci_indis_WIDTH:ikinci_indis_WIDTH,:);
end