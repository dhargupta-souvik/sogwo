% This function initialize the first population of search agents
function Positions=initialization(SearchAgents_no,dim,ub,lb)

Boundary_no= size(ub,2); % numnber of boundaries

% If the boundaries of all variables are equal and user enter a signle
% number for both ub and lb
if Boundary_no==1
    Positions=rand(SearchAgents_no,dim).*(ub-lb)+lb;
end

% If each variable has a different lb and ub
if Boundary_no>1
    for i=1:dim
        ub_i=ub(i);
        lb_i=lb(i);
        Positions(:,i)=rand(SearchAgents_no,1).*(ub_i-lb_i)+lb_i;
    end
end

% Boundary_no= size(ub,2); % numnber of boundaries
% 
% % If the boundaries of all variables are equal and user enter a signle
% % number for both ub and lb
% if Boundary_no==1
%     X=rand(5000,dim).*(ub-lb)+lb;
% end
% 
% % If each variable has a different lb and ub
% if Boundary_no>1
%     for i=1:dim
%         ub_i=ub(i);
%         lb_i=lb(i);
%         X(:,i)=rand(5000,1).*(ub_i-lb_i)+lb_i;
%     end
% end
% 
% k=SearchAgents_no;
% [idx,C]=kmeans(X,k,'MaxIter',200);
% Positions=C;