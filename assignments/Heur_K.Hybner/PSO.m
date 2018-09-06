function [Makespan,Neval]=PSO(enhancement,Oper,omega,...
    damp,c1,c2,N,maxeval,n,P_enh,beta,T_f,BKS)

D=length(Oper);
% Boundaries
p_min=-10;
p_max=10;
v_max=0.1*(p_max-p_min);
v_min=-v_max;
Neval=0; %number of evaluations

%swarm initialization 
p=(p_max-p_min)*rand(N,D)+p_min;
v=zeros(N,D);
p_best=p;
makespan_best=zeros(N,1);
makespan=makespan_best;

% initial fitness evaluation
for k=1:N
    seq=encode(p(k,:),n);
    makespan_best(k)=eval_makespan(seq,Oper,n); %initial pos. is best known local position
end

while Neval<maxeval
   %omega=omega-(omega_up-omega_low)/maxiter;% omega decreases linearly
   omega=damp*omega; 
    for k=1:N
        if enhancement % 1 ->MPSO; 0->PSO
            S=rand;
            if S<P_enh  % execute enhancement scheme
                T=makespan(k)-BKS; %starting temperature
                [p(k,:),Neval]=SA_enhancement(Oper,p(k,:),makespan(k),beta,T,T_f,n, Neval);
            end
        end
        
        seq=encode(p(k,:),n);
        makespan(k)=eval_makespan(seq,Oper,n);
        Neval=Neval+1;
        if makespan(k)<makespan_best(k) %update of best local position
            p_best(k,:)=p(k,:);
            makespan_best(k)=makespan(k);
        end
    end
    [Makespan,ind]=min(makespan_best);
    best=p(ind,:); %update of global best position
    
    if Makespan==BKS %the best solution has been reached
        break
    end
    
    for k=1:N
        r_1=rand(1,D);
        r_2=rand(1,D);
        %update of positions and velocities
        v(k,:)=omega*v(k,:)+c1*r_1.*(p_best(k,:)-p(k,:))+c2*r_2.*(best-p(k,:));
        % apply limits to v
        v(k,:)=max(v(k,:),v_min);
        v(k,:)=min(v(k,:),v_max);
        p(k,:)=p(k,:)+v(k,:);
        % change the sign of velocity if p is outside the box
        ind=p(k,:)<p_min | p(k,:)>p_max;
        v(k,ind)=-v(k,ind);
        % apply limits to p
        p(k,:)=max(p(k,:),p_min);
        p(k,:)=min(p(k,:),p_max);
    end
      
end