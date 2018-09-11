clear variables

tables={load('table_ft06.txt'),load('table_ft10.txt'), load('table_la01.txt')...
    , load('table_la02.txt'),load('table_la24.txt')};

Oper=cell(5);
n=zeros(5,1);
for i=1:5
Oper{i}=my_reshape(tables{i});
n(i)=size(tables{i},1);
end
BKS=[55,930,666,655,935];


%parameters of PSO
c1=1.5;
c2=2; % PSO parameters
omega=1;
damp=0.99; % omega^(i)=damp*omega^(i-1)
beta=0.99; %cooling rate
N=30; % population size
P_enh=0.01; % probability of executing SA enhancement 
T_f=0.1; %final annealing temperature
maxeval=300000;

if 0
    enhancement=1;
    j=1;
    
    [Makespan,Neval]=PSO(enhancement,Oper{j},omega,damp,c1,c2,N,...
        maxeval,n(j),P_enh,beta,T_f,BKS(j));
    
end

if 0
    j=1;
    max_repeat=0;
    
    [Makespan,Neval]=ShootGo(Oper{j},maxeval,max_repeat,BKS(j),n(j));
end

%%%%%%%%%%%%%%%%%%%%%%%% experiment. 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if 0
    
enhancement=1;
Timespan=zeros(5,5);
Neval=Timespan;
for j=1:5
    j
for i=1:5
[Timespan(i,j),Neval(i,j)]=PSO(enhancement,Oper{j},omega,damp,c1,c2,N,...
    maxeval,n(j),P_enh,beta,T_f,BKS(j));
end
end
MPSO.avg=mean(Timespan);
MPSO.best=min(Timespan);
MPSO.worst=max(Timespan);
MPSO.MNE=sum(Neval(Neval<maxeval))/sum(Neval<maxeval);
MPSO.Rel=sum(Neval<maxeval)/5;

enhancement=0;
Timespan=zeros(5,5);
Neval=Timespan;
for j=1:5
    j
for i=1:5
[Timespan(i,j),Neval(i,j)]=PSO(enhancement,Oper{j},omega,damp,c1,c2,N,...
    maxeval,n(j),P_enh,beta,T_f,BKS(j));
end
end
PSO.avg=mean(Timespan);
PSO.best=min(Timespan);
PSO.worst=max(Timespan);
PSO.MNE=sum(Neval(Neval<maxeval))/sum(Neval<maxeval);
PSO.Rel=sum(Neval<maxeval)/5;

end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%% experiment 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if 0
    
enhancement=1;
Oper=Oper{2};
n=n(2);
BKS=BKS(2);

Timespan=zeros(5,5,5);
N_new=[5 10 20 30 40];
beta_new=[0.8 0.85 0.9 0.95 0.99];
for i=1:5
    i
    for j=1:5
        j
        for k=1:5
            Timespan(i,j,k)=PSO(enhancement,Oper,omega,damp,c1,c2,N_new(i),...
                maxeval,n,P_enh,beta_new(j),T_f,BKS);
        end
    end
end
avg=mean(Timespan,3);
avg_N=mean(avg,2);
avg_beta=mean(avg);

end


%%%%%%%%%%%%%%%%%%%%%%%% Shoot&Go %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if 0
%parameters of ShootGo
max_repeat=5;

Timespan=zeros(5,5);
Neval=Timespan;
for j=1:5
    j
for i=1:5
[Timespan(i,j),Neval(i,j)]=ShootGo(Oper{j},maxeval,max_repeat,BKS(j),n(j));
end
end
ShoGo.avg=mean(Timespan);
ShoGo.best=min(Timespan);
ShoGo.worst=max(Timespan);
ShoGo.MNE=sum(Neval(Neval<maxeval))./sum(Neval<maxeval);
ShoGo.Rel=sum(Neval<maxeval)/5;

end