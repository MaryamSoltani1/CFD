function A=showmatrix(l,d,u)
 
    n=length(d);
    A=zeros(n,n);
    A(1,1) = d(1);   A(1,2) = u(1);    A(n,n-1) = l(n);    A(n,n)=d(n);
    
    for ii=2:n-1
        A(ii,ii-1)=l(ii);
        A(ii,ii)=d(ii);
        A(ii,ii+1)=u(ii);
    end
    