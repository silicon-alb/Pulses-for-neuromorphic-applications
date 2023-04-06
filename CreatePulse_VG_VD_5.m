%##### CREATOR ALBERT.D############

%# Pulses-for-neuromorphic-applications
%A matlab program with additional csv files to create piecewise linear curves to potentiate and read neurons.
%The matlab program outputs a time vs. Gate voltage and time vs. Drain voltage in text files 'VG.txt' and 'VD.txt'
%VG.txt and VD.txt can be used to potentiate a FeFET/ RRAM and other synaptic devices.
%VG#5 and VD#5 are template pulses. The number of cycles -->'cycles' in the Matlab code determines the number of positive pulses. The number of total positive pulses in VG.txt is = cycles+1.
%

clc;
clear all;
close all;

%%%%%%  Read The CSV File %%%%%
FileName1=["VG#5"];
FileName2=["VD#5"];
LFN=length(FileName1);
%%%%%%%   Write csv file to matrix %%%%%%
M = readmatrix(FileName1);
t=M(:,1);
VG=M(:,2);

N = readmatrix(FileName2);
td=N(:,1);
VD=N(:,2);

%%%%%% For n cycles no. of pulses created is n+1
cycle=5;
% c1=10;
for j=1:1:cycle
    c=11;
for k=19:1:(cycle+1)*8+9
    t(k)=t(c)+21*10^-6;    %%%%21us is the period of square pulses
    td(k)=td(c)+21*10^-6;
    VG(k)=VG(c);
    VD(k)=VD(c);
    c=c+1;
%     c1=c1+1;
end
end


% plot(VG)
%%%%%% Write VG and VD to t and td

for p=1:1:length(t)
    t(p,2)=VG(p);
    td(p,2)=VD(p);
end

figure(2)
% subplot(2,1,1)
plot(t(:,1),t(:,2));
hold on;
plot(td(:,1),td(:,2));

writematrix(t,'VG.txt','Delimiter','space')
type 'VG.txt'

writematrix(td,'VD.txt','Delimiter','space')
type 'VD.txt'
