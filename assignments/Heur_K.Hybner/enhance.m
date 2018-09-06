function y=enhance(x, enh_id)

    function y=swap(x)
        p=randi(length(x));
        q=randi(length(x));
        while p==q
            p=randi(length(x));
            q=randi(length(x));
        end
        y=x;
        y(p)=x(q);
        y(q)=x(p);
    end

    function y=insert(x)
        p=randi(length(x));
        q=randi(length(x));
        while p==q
            p=randi(length(x));
            q=randi(length(x));
        end
        y=x;
        y(q)=x(p);
        y(p:q-1)=x(p+1:q);
    end

    function y=invert(x)
        p=randi(length(x));
        q=randi(length(x));
        while p==q
            p=randi(length(x));
            q=randi(length(x));
        end
        y=x;
        y(min(p,q):max(p,q))=x(max(p,q):-1:min(p,q));
    end


    function y=jump(x)
        n=length(x);
        p=randi(n);
        q=randi(n);
        r=randi(n);
        while p==q  || (r>=min(p,q) && r<=max(p,q))
            p=randi(n);
            q=randi(n);
            r=randi(n);
        end
        y=zeros(1,n);
        ind=y;
        for k=0:max(p,q)-min(p,q)
            y(mod(r+k-1,n)+1)=x(min(p,q)+k);
            ind(mod(r+k-1,n)+1)=1;
        end
        y(ind==0)=[x(1:min(p,q)-1),x(min(p,q)+1+max(p,q)-min(p,q):end)];
    end

switch enh_id
    case 1
        y=swap(x);
    case 2
        y=insert(x);
    case 3
        y=invert(x);
    case 4
        y=jump(x);
end


end