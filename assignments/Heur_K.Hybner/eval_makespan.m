function makespan=eval_makespan(seq,Oper,n)
m=length(Oper)/n;
A=zeros(m,n);
for i=1:length(seq)
    machind=Oper(seq(i),1);
    time=Oper(seq(i),2);
    jobind=ceil(seq(i)/m);
    A(machind,jobind)=time+max([max(A(machind,:)),max(A(:,jobind))]);
end
makespan=max(A(:));