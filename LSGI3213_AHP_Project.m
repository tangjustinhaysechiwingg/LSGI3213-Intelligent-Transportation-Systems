function [final_score]= AHP 

filename = 'LSGI3213_ITS_AHP.xlsx';
Raw_data = xlsread(filename);

test_matrix=[1 4 6 2;0.25 1 2 0.5;1/6 0.5 1 1/3;0.5 2 3 1];

RI=[0 0 0.58 0.91 1.12 1.24 1.32 1.41 1.45 1.49];

L = length(test_matrix);

szdim = size(test_matrix,2);

S = sum(test_matrix);

for col = 1:L

test_matrix(:,col) =test_matrix(:,col)/S(col);

end

W = sum(test_matrix,2)*1/L;

for col = 1:L

PEv(col)=W(col)*S(col);

end

PEv_sum = sum(PEv);

CI=(PEv_sum-L)/(L-1); CR=CI/RI(L);

if CR>0.1

disp('The CR value is not acceptable!');

return;

end

S=1./S;

total_weight=sum(S,2);

for col =1:szdim

final_weight(col) =S(col)/total_weight;

end

raw_data_lenght = length(Raw_data);

for data_col = 1:raw_data_lenght

final_score(data_col) = Raw_data(data_col,1)*final_weight(1)+Raw_data(data_col,2)*final_weight(2)+Raw_data(data_col,3)*fina l_weight(3)+Raw_data(data_col,4)*final_weight(4);
end

final_score=final_score';

disp('The CR value is: ');

disp(CR);

end
