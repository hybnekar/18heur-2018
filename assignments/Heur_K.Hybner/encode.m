function seq=encode(RK,n)
[~,ind]=sort(RK);
[~,ind]=sort(ind);

ind=mod(ind,n)+1;
[~,ind]=sort(ind);
[~,seq]=sort(ind);
