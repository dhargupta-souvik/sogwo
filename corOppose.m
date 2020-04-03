function [Positions]=corOppose(Positions,fitness,ub,lb,upper,lower,dim,threshold)




%fprintf('**%d %d %d %d\n',size(upper,1),size(upper,2),size(lower,1),size(lower,2))

n=size(fitness);
for i=4:n(1)
    sum=0;
    greater=[];
    less=[];
    x=1;z=1;y=1;
    
    for j=1:size(Positions(1,:),2)
        
        d(x)=abs(Positions(1,j)-Positions(i,j));
        if d(x)<threshold
            greater(y)=j;
            y=y+1;
        else
            less(z)=j;
            z=z+1;
        end
        sum=sum+d(x)*d(x);
        x=x+1;
    end
%     sum
    src=1-(double(6*sum))/(double(n(1)*(n(1)*n(1)-1)));
%     src
    if src<=0
        if size(greater)<size(less)
%             for j=1:size(less)
%                 dim=less(j);
%                 Positions(i,dim)=ub(dim)+lb(dim)-Positions(i,dim);
%             end
        else
            for j=1:size(greater)
                dim=greater(j);
                Positions(i,dim)=upper(1,dim)+lower(1,dim)-Positions(i,dim);
            end
        end
    end
end
end

