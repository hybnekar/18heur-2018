function [p,Neval]=SA_enhancement(Oper,p,makespan,beta,T,T_f,n,Neval)
%setting of probabilities of executing different type of enhancement
%does not seem to have an effect
    p1=0.4;
    p2=0.4;
    p3=0.1;
while T>T_f
    
    R=rand;
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
    if makespan_new>makespan
        delta=makespan_new-makespan;
        R=rand;
        if R< exp(-delta/T)
            p=p_new;
            makespan=makespan_new;
        end
    else
        p=p_new;
        makespan=makespan_new;
        T=beta*T;
    end
end
