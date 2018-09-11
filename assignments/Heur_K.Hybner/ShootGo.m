function [makespan_best,Neval]=ShootGo(Oper,maxeval,max_repeat,BKS,n)
D=length(Oper);
p1=0.4;
p2=0.4;
p3=0.1;
Neval=0; %number of evaluations

%initialization
p=randperm(D);
seq=encode(p,n);
makespan_best=eval_makespan(seq,Oper,n);

while Neval<maxeval
    p=randperm(D);
    seq=encode(p,n);
    makespan=eval_makespan(seq,Oper,n);
    Neval=Neval+1;
    for i=1:max_repeat
        
        R=rand; %Random descent
        if R<=p1
            p_new=enhance(p,1); % swap
        elseif R<=p1+p2 && p1<R
            p_new=enhance(p,2); %insertion
        elseif R<=p1+p2+p3 && p1+p2<R
            p_new=enhance(p,3); %inversion
        else
            p_new=enhance(p,4); %jump
        end
        
        seq=encode(p_new,n);
        makespan_new=eval_makespan(seq,Oper,n);
        Neval=Neval+1;
        
        if makespan_new<makespan
            p=p_new;
            makespan=makespan_new;
        else break
        end
    end
    if makespan<makespan_best
        makespan_best=makespan;
    end
    if makespan_best==BKS
        break
    end
    
end


