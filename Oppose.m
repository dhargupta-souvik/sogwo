function [ Positions ] = Oppose( Positions,fitness,sorted_fitness,ub,lb,fobj )

for i=size(fitness)/2:size(fitness)
    score=sorted_fitness(i);
    for j=1:size(fitness)
        if fitness(j)==score
            if(fobj(Positions(j,:))>fobj(opposition(Positions(i,:),ub,lb)))
                Positions(j,:)=opposition(Positions(i,:),ub,lb);
            end
            break;
        end
    end

end

% for j=1:size(fitness)
%     if fitness(j)<bmark
%         Positions(j,:)=opposition(Positions(j,:),ub,lb);
%         break;
%     end
% end

