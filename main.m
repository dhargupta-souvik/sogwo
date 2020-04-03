% The initial parameters that you need are:
%__________________________________________
% fobj = @YourCostFunction
% dim = number of your variables
% Max_iteration = maximum number of generations
% SearchAgents_no = number of search agents
% lb=[lb1,lb2,...,lbn] where lbn is the lower bound of variable n
% ub=[ub1,ub2,...,ubn] where ubn is the upper bound of variable n
% If all the variables have equal lower bound you can just
% define lb and ub as two single number numbers

% To run GWO: [Best_score,Best_pos,GWO_cg_curve]=GWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj)
%__________________________________________

clear all 
clc

SearchAgents_no=50; % Number of search agents

Function_name={'F1','F2','F3','F4','F5','F6','F7','F8','F9','F10','F11','F12','F13','F14','F15','F16','F17','F18','F19','F20','F21','F22','F23'}; 
% Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)

Max_iteration=1000; % Maximum numbef of iterations

% Load details of the selected benchmark function


for x=1:23
    [lb,ub,dim,fobj]=Get_Functions_details(num2str(cell2mat(Function_name(x))));
    
 	PSO_cg_curve=PSO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj); % run PSO to compare to results
     [Best_score,Best_pos,GWO_cg_curve]=GWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

     Best_score=zeros(1,50);
     Best_score2=zeros(25,1);
     GWO_cg_curve=zeros(500,50);
     GWO_cg_curve2=zeros(25,1000);

    
    for loop=1:10
        [Best_score(:,loop),Best_pos,GWO_cg_curve(:,loop)]=GWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
        [Best_score2(loop),Best_pos2,GWO_cg_curve2(loop,:)]=OGWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
    end
    Best_score=sort(Best_score);
    Best_score2=sort(Best_score2);


    Best_GWO=Best_score(1);
    Best_OGWO=Best_score2(1);
 
    Avg_GWO=mean(Best_score);
    Avg_OGWO=mean(Best_score2);
 
     Std_GWO=std(Best_score);
     Std_OGWO=std(Best_score2);
 
    Avg_GWO_cg_curve=GWO_cg_curve(:,1);
    Avg_OGWO_cg_curve=GWO_cg_curve2(1,:);

    Avg_GWO=mean(Best_score);
    Avg_coa=mean(cost);

    Std_GWO=std(Best_score);
    Std_coa=std(cost);



     figure('Position',[500 500 660 290])
     Draw search space
     subplot(1,2,1);
     func_plot(num2str(cell2mat(Function_name(1))));
     title('Parameter space')
     xlabel('x_1');
     ylabel('x_2');
     zlabel([num2str(cell2mat(Function_name(1))),'( x_1 , x_2 )'])
 
     %Draw objective space
     subplot(1,2,2);
     semilogy(GWO_cg_curve,'Color','r')
     hold on
     semilogy(PSO_cg_curve,'Color','b')
     hold on
     semilogy(Avg_OGWO_cg_curve,'Color','g')
     title('Objective space')
     xlabel('Iteration');
     ylabel('Best score obtained so far');
 
     axis tight
     grid on
    box on
     legend('GWO','PSO','OGWO')



    fprintf('function name:%s\n',Function_name(x));
    fprintf('best:%e %e\n',Best_GWO,Best_OGWO);
    fprintf('avg:%e %e\n',Avg_GWO,Avg_OGWO);
    fprintf('std:%e  %e\n',Std_GWO,Std_OGWO);


 
end


