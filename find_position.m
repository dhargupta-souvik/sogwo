function [ newposition ] = find_position( score,fitness,Positions)

for i=1:size(fitness)
    if fitness(i)==score
        newposition=Positions(i,:);
        break;
    end
end
end

