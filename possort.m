function [Positions,fitness]=possort(Positions,fitness)

for i=1:size(fitness)-1
    for j= 1:size(fitness)-i-1
        if fitness(j)>fitness(j+1)
            
            temp=fitness(j);
            fitness(j)=fitness(j+1);
            fitness(j+1)=temp;
            
            temppos=Positions(j,:);
            Positions(j,:)=Positions(j+1,:);
            Positions(j+1,:)=temppos;
        end
    end
end

end

