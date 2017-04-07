Ip1=linspace(-4,-0.5,8);
Ip2=linspace(0,4.25,18);
Ip=[Ip1 Ip2]';%Spise aray pri katerem smo izvedli meritve toka v Amperih

Um_amr=[-663 -582 -498 -416 -333 -250 -168 -86 -2 41 83 125 166 207 248 289 330 373 416 455 495 537 580 619 660 701]';% tega je treba pa pac na roko :-( je v mV

%%%%% Za linearizacijo
x1=ones(size(Um_amr));
X=[Um_amr x1];
Y=Ip;
kn=Y\X;
figure
plot(Ip,Um_amr);
hold on;
plot([-4 4.25],[-4*kn(1)+kn(2) 4.25*kn(1)+kn(2)],'-r');
grid on;
xlabel('I_p/A')
ylabel('U_m/mV')
legend('meritve','linearizacija meritev','Location','SouthEast')
slope_amr=kn(1);
offset_amr=kn(2);
Umlin=slope_amr*Ip + offset_amr;
error_amr=abs(Umlin-Um_amr);
avrageerror_amr=norm(error_amr,1)/max(size(error_amr));%povprecen pogresek v mV
%ce zelis dobiti matrkio v latexu odkomentiraj spodnjo vrstico
%matrix2latex([Ip Um_amr], 'amrUI.tex', 'columnLabels', {'$I_p$/A' '$U_m$/mV'}, 'alignment', 'c', 'format', '%-6.2f', 'size', 'norma');


%%% Se za hallovo sondo
Um_hall=[-3880 -3400 -2920 -2440 -1950 -1467 -982 -497 -13 226 473 722 963 1204 1445 1690 1933 2170 2420 2660 2900 3150 3370 3610 3860 4080]';


%%%%% Za linearizacijo
x1=ones(size(Um_hall));
X=[Um_hall x1];
Y=Ip;
kn=Y\X;
figure
plot(Ip,Um_hall);
hold on;
plot([-4 4.25],[-4*kn(1)+kn(2) 4.25*kn(1)+kn(2)],'-r');
grid on;
xlabel('I_p/A')
ylabel('U_m/mV')
legend('meritve','linearizacija meritev','Location','SouthEast')
slope_hall=kn(1);
offset_hall=kn(2);
Umlin=slope_hall*Ip + offset_hall;
error_hall=abs(Umlin-Um_hall);
avrageerror_hall=norm(error_hall,1)/max(size(error_hall));%povprecen pogresek v mV
%ce zelis dobiti matrkio v latexu odkomentiraj spodnjo vrstico
%matrix2latex([Ip Um_hall], 'hallUI.tex', 'columnLabels', {'$I_p$/A' '$U_m$/mV'}, 'alignment', 'c', 'format', '%-6.2f', 'size', 'norma;');



