%Data input(missing & original) from excel
%{
prompt = {'Enter Missing Data Filename','Enter Original Data Filename:'};
title = 'Input';
dims = [1 35];
definput = {'Med5.xlsx','Iris.xlsx'};
%}
Ntable=readtable('NRMSvalue.xlsx');
prompt = {'Enter Original Data Filename:'};
title = 'Input';
dims = [1 35];
definput = {'Iris.xlsx'};
DataInput = inputdlg(prompt,title,dims,definput);
Originalmatrix=normc(xlsread(char(DataInput(1,1))));
for i=1:8
for j=1:4
inputmatrix=normc(xlsread(char(Ntable{i,j})));

%Imputation & NRMS functions
finalmatrix=stage1(inputmatrix);
distance=correlation(finalmatrix);
[kmatrix,sorteddismatrix,ri]=knn(distance);
tdmatrix=findingmissing(inputmatrix,sorteddismatrix,kmatrix,distance);
Error1 = NRMS(finalmatrix, Originalmatrix);
Error2= NRMS(tdmatrix, Originalmatrix);

% Display content
disp(['Original Dataset: ',char(DataInput(1,1))]);
disp(['Missing Dataset: ',char(Ntable{i,j})]);
disp(['NRMS1: ',num2str(Error1)]);
disp(['NRMS2: ',num2str(Error2)]);

Nvalue1(i,j)=Error1;
Nvalue2(i,j)=Error2;

end
end
for j=1:3
inputmatrix=normc(xlsread(char(Ntable{9,j})));

%Imputation & NRMS functions
finalmatrix=stage1(inputmatrix);
distance=correlation(finalmatrix);
[kmatrix,sorteddismatrix,ri]=knn(distance);
tdmatrix=findingmissing(inputmatrix,sorteddismatrix,kmatrix,distance);
Error1 = NRMS(finalmatrix, Originalmatrix);
Error2= NRMS(tdmatrix, Originalmatrix);

% Display content
disp(['Original Dataset: ',char(DataInput(1,1))]);
disp(['Missing Dataset: ',char(Ntable{9,j})]);
disp(['NRMS1: ',num2str(Error1)]);
disp(['NRMS2: ',num2str(Error2)]);

Nvalue1(9,j)=Error1;
Nvalue2(9,j)=Error2;

end
xlswrite('Nvalue1.xlsx',Nvalue1);
xlswrite('Nvalue2.xlsx',Nvalue2);




