%Data input(missing & original) from excel
prompt = {'Enter Missing Data Filename','Enter Original Data Filename:'};
title = 'Input';
dims = [1 35];
definput = {'Simple1.xlsx','Sheart.xlsx'};
DataInput = inputdlg(prompt,title,dims,definput);
datasetname=DataInput{2,1};
%list=readtable('List of Datasets.xlsx');
A=xlsread(char(DataInput(1,1)));
[inputmatrix,nr]=normalize(A);
%inputmatrix=inputdata(inputmatrix1,datasetname,list);
Originalmatrix=xlsread(char(DataInput(2,1)));

%Imputation & NRMS functions
finalmatrix1=stage1(inputmatrix);
finalmatrix=denorm(finalmatrix1,nr);
distance=correlation(finalmatrix);
[kmatrix,sorteddismatrix,ri]=knn(distance);
tdmatrix1=findingmissing(inputmatrix,sorteddismatrix,kmatrix,distance);
tdmatrix=denorm(tdmatrix1,nr);
Error1 = NRMS(finalmatrix, Originalmatrix);
Error2= NRMS(tdmatrix, Originalmatrix);

% Display content
disp(['Original Dataset: ',char(DataInput(1,1))]);
disp(['Missing Dataset: ',char(DataInput(2,1))]);
disp(['NRMS1: ',num2str(Error1)]);
disp(['NRMS2: ',num2str(Error2)]);


