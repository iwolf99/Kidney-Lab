% Part 2
clear all

c0 = 1;
del_x=0.1;
Lmax=10;

L=0:del_x:Lmax; 

rho=2*ones(size(L)); 

[c_orig] = calc_cX_4_7_14(L,rho,c0,del_x,1);
c_est = c_orig;
c_star = 0.01;

[c_new] = calc_cX_4_7_13(L,rho,c_est,c_star,c0,del_x);

