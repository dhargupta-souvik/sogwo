# MATLAB code for Selective Opposition based GWO

Code to perform function optimization.

### This is code for paper entitled - "Selective Opposition based Grey Wolf Optimization"

## The code given is for three algorithms:
* Selective Opposition based Grey Wolf Optimization (SOGWO)
* Grey Wolf Optimization (GWO) 
* Particle Swarm Optimization (PSO)

## Parameters

The following parameters must be set in main.m file for running the code
* iteration - the number of runs per function
* SearchAgents_no - population size
* Max_iteration - iterations of each function to be executed
* algo_choice - which algorithm to run


## Running the code
* Set all the required parameters in the files specified above
* run file _main.m_

Link for algorithm details: [Paper](https://www.sciencedirect.com/science/article/abs/pii/S095741742030213X)

## Abstract:

The use of metaheuristics is widespread for optimization in both scientific and industrial problems due to several reasons, including flexibility, simplicity, and robustness. Grey Wolf Optimizer (GWO) is one of the most recent and popular algorithms in this area. In this work, opposition-based learning (OBL) is combined with GWO to enhance its exploratory behavior while maintaining a fast convergence rate. Spearman's correlation coefficient is used to determine the omega (ω) wolves (wolves with the lowest social status in the pack) on which to perform opposition learning. Instead of opposing all the dimensions in the wolf, a few dimensions of the wolf are selected on which opposition is applied. This assists with avoiding unnecessary exploration and achieving a fast convergence without deteriorating the probability of finding optimum solutions. The proposed algorithm is tested on 23 optimization functions. An extensive comparative study demonstrates the superiority of the proposed method.