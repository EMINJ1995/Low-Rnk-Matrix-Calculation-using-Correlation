%Data input(missing & original) from excel
clc;
clear;
prompt = {'Enter Missing Data Filename','Enter Original Data Filename:'};
title = 'Input';
dims = [1 35];
definput = {'Blend1_UD.xlsx','Chess-Krkopt.xlsx'};
DataInput = inputdlg(prompt,title,dims,definput);
datasetname=char(DataInput(2,1));
O=readtable(char(DataInput(2,1)),'ReadVariableNames',false);
list=readtable("List of Datasets.xlsx");
inputmatrix1=readtable((char(DataInput(1,1))),'ReadVariableNames',false);
[data,GL,DN,numm,catm]=inputdata(inputmatrix1,datasetname,list);

[NRMSvalue,AEvalue,IM]=outputdata(data,O,GL,DN,numm,catm);

imputedmatrix=IM;


% Display content
disp(['Original Dataset: ',char(DataInput(1,1))]);
disp(['Missing Dataset: ',char(DataInput(2,1))]);
disp(['NRMS: ',num2str(NRMSvalue)]);
disp(['AE: ',num2str(AEvalue)]);


