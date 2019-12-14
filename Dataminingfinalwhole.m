clc;
clear;
Ntable=readtable('NRMSvalue.xlsx');
prompt = {'Enter Original Data Filename:'};
title = 'Input';
dims = [1 35];
definput = {'Chess-Krkopt.xlsx'};
DataInput = inputdlg(prompt,title,dims,definput);
datasetname=char(DataInput(1,1));
O=readtable(char(DataInput(1,1)),'ReadVariableNames',false);
[m,n]=size(O);
list=readtable("List of Datasets.xlsx");
k=1;
Nvalue=zeros(9,4);
Avalue=zeros(9,4);
%Imputation & NRMS functions
for i=1:8
for j=1:4
inputmatrix1=readtable((char(Ntable{i,j})),'ReadVariableNames',false);
[data,GL,DN]=inputdata(inputmatrix1,datasetname,list);

[NRMSvalue,AEvalue,IM]=outputdata(data,O,GL,DN);



% Display content
disp(['Original Dataset: ',char(DataInput(1,1))]);
disp(['Missing Dataset: ',char(Ntable{i,j})]);
disp(['NRMS: ',num2str(NRMSvalue)]);
disp(['AE: ',num2str(AEvalue)]);

Nvalue(i,j)=NRMSvalue;
Avalue(i,j)=AEvalue;
IM1=array2table(IM);
writetable(IM1,char(Ntable{i,j}),'WriteVariableNames',false);
end
end
for j=1:3
inputmatrix1=readtable((char(Ntable{9,j})),'ReadVariableNames',false);
[data,GL,DN]=inputdata(inputmatrix1,datasetname,list);

[NRMSvalue,AEvalue,IM]=outputdata(data,O,GL,DN);

imputedmatrix=IM;


% Display content
disp(['Original Dataset: ',char(DataInput(1,1))]);
disp(['Missing Dataset: ',char(Ntable{9,j})]);
disp(['NRMS: ',num2str(NRMSvalue)]);
disp(['AE: ',num2str(AEvalue)]);

Nvalue(9,j)=NRMSvalue;
Avalue(9,j)=AEvalue;
IM1=array2table(IM);
writetable(IM1,char(Ntable{i,j}),'WriteVariableNames',false);

end
xlswrite('Nvalue.xlsx',Nvalue);
xlswrite('Avalue.xlsx',Avalue);
