% function t=project_conv(audio1,audio2)
%     [y1 Fs1]=audioread(audio1);
%     [y2 Fs2]=audioread(audio2);
%     y1=[abs(y1(:,1))];
%     y2=[abs(y2(:,1))];
%     w=conv(y1,y2);
%     t=max(w);
%     end

if abs(project_conv('ambulance_template.wav','test3.wav')-1.4e+03)<0.2e+03;
    %condition 1 that identifies a peak in the convolved signal of the
    %fourier transform(in time domain) and if found within tolerance range
    %proceeds to check condition 2.
%********************************************************************************************************************************************
    %function [f,Y]=project205(sound_signal)
    %    [y,Fs] = audioread(sound_signal);
    %    newlength=2^nextpow2(length(y));
    %    f=Fs/2*linspace(0,1,newlength/2+1);
    %    Y=fft(y,newlength)/length(y);    
    %end
    %The above function computes the fourier transform and returns a 2-D array
    %plotting which we can get amplitude vs frequency graph.
    figure(1)
    [f1,Y1,newlength1]=project205('ambulance_template.wav');
    plot(f1,2*abs(Y1(1:newlength1/2+1)),'blue');
    hold on
    [f2,Y2,newlength2]=project205('test3.wav');
    

    %to normalise the signals, we multiply of the signals with a constant
    sum_1=0;
    sum_2=0;
    for i=1:length(Y1)
        sum_1=sum_1+abs(Y1(i));
        sum_2=sum_2+abs(Y2(i));
    end

    Y2=Y2*sum_1/sum_2;
    plot(f2,2*abs(Y2(1:newlength2/2+1)),'red');
    title('Amplitude vs Frequency');
    xlabel('Frequency(Hz)');
    ylabel('Amplitude');
    
    figure(2)
    plot(f1,2*abs(Y1(1:newlength1/2+1)),'blue');
    title('Amplitude vs Frequency');
    xlabel('Frequency(Hz)');
    ylabel('Amplitude');
    
    
    figure(3)
    plot(f2,2*abs(Y2(1:newlength2/2+1)),'red');
    title('Amplitude vs Frequency');
    xlabel('Frequency(Hz)');
    ylabel('Amplitude');
    

    %disp(abs(Y1));
    match=0;
    count=0;
    Y2=abs(Y2);
    Y1=abs(Y1);
    for i=1:length(Y2)
       if(Y2(i)>=0.0005)
           if(abs(Y2(i)-Y1(i))<=0.0003 || abs(Y2(i)-Y1(i+1))<=0.0003 || abs(Y2(i)-Y1(i-1))<=0.0003)
               match=match+1;
           end
           count=count+1;       
       end
    end
    %disp(match);
    %disp(count);
    %The normalised amplitudes are then matched with the amplitudes of the
    %template signal and if in tolernacee region, increases the match
    %count.

    if(match/count>0.4)
        [y,fs]=audioread('yes.m4a');
        sound(y,fs);
    else
        [y,fs]=audioread('no.m4a');
        sound(y,fs);
    end
else
    [f1,Y1,newlength1]=project205('ambulance_template.wav');
    figure(1)
    plot(f1,2*abs(Y1(1:newlength1/2+1)),'blue');
    title('Amplitude vs Frequency');
    xlabel('Frequency(Hz)');
    ylabel('Amplitude');
    
    [f2,Y2,newlength2]=project205('test3.wav');
    figure(2)
    plot(f2,2*abs(Y2(1:newlength2/2+1)),'red');
    title('Amplitude vs Frequency');
    xlabel('Frequency(Hz)');
    ylabel('Amplitude');
    
    figure(3)
    plot(f1,2*abs(Y1(1:newlength1/2+1)),'blue');
    hold on
    plot(f2,2*abs(Y2(1:newlength2/2+1)),'red');
    title('Amplitude vs Frequency');
    xlabel('Frequency(Hz)');
    ylabel('Amplitude');
    
    [y,fs]=audioread('no.m4a');
    sound(y,fs);
end



       
