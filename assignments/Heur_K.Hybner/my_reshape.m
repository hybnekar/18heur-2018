function Oper=my_reshape(table)
[n,m]=size(table);
m=m/2;
Oper=zeros(n*m,2);

j=1;

for i=1:n
    reshaped=[];
    for k=1:m
        reshaped=cat(1,reshaped,table(i,2*k-1:2*k));
    end
    Oper(j:j+m-1,:)=reshaped;
    j=j+m;
end
Oper(:,1)=Oper(:,1)+1;