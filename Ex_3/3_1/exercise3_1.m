format shortEng

%calculate the deviation:
[A1,a1] = getdeviation(51,20)
[A2,a2] = getdeviation(101,20)
[A3,a3] = getdeviation(201,20)
[A4,a4] = getdeviation(401,20)
[A5,a5] = getdeviation(801,20)
[A6, a6] = getdeviation(6001,20)

xvalues =[a1, a2, a3, a4, a5];
Deig1=[A1(1),A2(1), A3(1), A4(1), A5(1)];
Deig2=[A1(2),A2(2), A3(2), A4(2), A5(2)];
Deig3=[A1(3),A2(3), A3(3), A4(3), A5(3)];
Deig4=[A1(4),A2(4), A3(4), A4(4), A5(4)];
Deig5=[A1(5),A2(5), A3(5), A4(5), A5(5)];


%plot the derivation in dependance of the a:
% figure
% scatter(xvalues, Deig1)
% title('eigenvalue 1 ( = 0.5)')
% xlabel('a = L/N')
% ylabel('Deviation')
% xticks([0 20/801 20/401 20/201 20/101 20/51])
% xticklabels({'0','20/801','20/401','20/201','20/101','20/51'})
% 
% figure
% scatter(xvalues, Deig2)
% title('eigenvalue 2 ( = 1.5)')
% xlabel('a = L/N')
% ylabel('Deviation')
% xticks([0 20/801 20/401 20/201 20/101 20/51])
% xticklabels({'0','20/801','20/401','20/201','20/101','20/51'})
% 
% figure
% scatter(xvalues, Deig3)
% title('eigenvalue 3 ( = 2.5)')
% xlabel('a = L/N')
% ylabel('Deviation')
% xticks([0 20/801 20/401 20/201 20/101 20/51])
% xticklabels({'0','20/801','20/401','20/201','20/101','20/51'})
% 
% figure
% scatter(xvalues, Deig4)
% title('eigenvalue 4 ( = 3.5)')
% xlabel('a = L/N')
% ylabel('Deviation')
% xticks([0 20/801 20/401 20/201 20/101 20/51])
% xticklabels({'0','20/801','20/401','20/201','20/101','20/51'})
% 
% figure
% scatter(xvalues, Deig5)
% title('eigenvalue 5 ( = 4.5)')
% xlabel('a = L/N')
% ylabel('Deviation')
% xticks([0 20/801 20/401 20/201 20/101 20/51])
% xticklabels({'0','20/801','20/401','20/201','20/101','20/51'})
