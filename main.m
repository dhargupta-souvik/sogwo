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

function [] = main()

SearchAgents_no=50; % Number of search agents

Function_name={'F1','F2','F3','F4','F5','F6','F7','F8','F9','F10','F11','F12','F13','F14','F15','F16','F17','F18','F19','F20','F21','F22','F23'};
% Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)

iteration = 30; % number of times the algorithm for easch function is run

Max_iteration=1000; % Maximum numbef of iterations

algo_choice = 3; % 1 - PSO, 2 - GWO, 3 - SOGWO

% Load details of the selected benchmark function


for x=1:size(Function_name,2)
    [lb,ub,dim,fobj]=Get_Functions_details(num2str(cell2mat(Function_name(x))));
    
    best_score=zeros(1,iteration);
    curve=zeros(iteration,Max_iteration);
    
    
    for loop=1:iteration
        switch(algo_choice)
            case 1
                [best_score(1,loop), curve(loop,:)] = PSO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
                break;
            case 2
                [best_score(1,loop), ~ ,curve(loop,:)] = GWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
                break;
            case 3
                [best_score(loop), ~ ,curve(loop,:)] = SOGWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
                break;
        end
        
    end
    best_score=sort(best_score);
    
    avg = mean(best_score);
    std_dev = std(best_score);
    
    fprintf('\n\nfunction name: %s \n',Function_name{x});
    fprintf('max:%e\n',best_score(1,1));
    fprintf('min:%e\n',best_score(1,1));
    fprintf('avg:%e\n',avg);
    fprintf('std:%e\n',std_dev);
end
end

%% call to draw a plot for 3 algorithm results
function [] = drawComparisonPlot(function_name, curve_list, curve_name_list, curve_color_list)

figure('Position',[500 500 660 290])
Draw search space
subplot(1,2,1);
func_plot(num2str(cell2mat(function_name)));
title('Parameter space')
xlabel('x_1');
ylabel('x_2');
zlabel([num2str(cell2mat(function_name)),'( x_1 , x_2 )'])

%Draw objective space
subplot(1,2,2);
for loop = 1:size(curve_list,1)
    semilogy(curve_list(:,loop),'Color',curve_color_list(1,loop));
    hold on;
end
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid on
box on
legend(curve_name_list)  % chnage this according to your required names
end
