function [m,x]=TDMAmethod(m,n)

    m(1,2)=m(1,2)/m(1,1);
    n(1)=n(1)/m(1,1);
    m(1,1)=m(1,1)/m(1,1);

    for ii=2:length(n)-1
        
        m(ii,ii)=m(ii,ii)-m(ii,ii-1)*m(ii-1,ii);
        m(ii,ii+1)=m(ii,ii+1)-m(ii,ii-1)*m(ii-1,ii+1);
        n(ii)=n(ii)-n(ii-1)*m(ii,ii-1);
        m(ii,ii-1)=0;

        
        m(ii,ii-1)=m(ii,ii-1)/m(ii,ii);
        m(ii,ii+1)=m(ii,ii+1)/m(ii,ii);
        n(ii)=n(ii)/m(ii,ii);
        m(ii,ii)=1;

        
    end
    ii=length(n);
    m(ii,ii)=m(ii,ii)-m(ii,ii-1)*m(ii-1,ii);
    n(ii)=n(ii)-n(ii-1)*m(ii,ii-1);    
    m(ii,ii-1)=0;

    
    x=zeros(1,length(n));
    
    x(ii)=n(ii)/m(ii,ii);
    
    for ii=length(n)-1:-1:1
        x(ii)=n(ii)-x(ii+1)*m(ii,ii+1);
    end