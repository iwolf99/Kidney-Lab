% Part 1
clear all

c0 = 1;
del_x=0.1;
Lmax=10;

L=0:del_x:Lmax;

rho=2*ones(size(L));

for int_flag=1:2
    tstart(int_flag)=tic;
    
    [cX] = calc_cX_4_7_14(L,rho,c0,del_x,int_flag);
    
    telapsed(int_flag)=toc(tstart(int_flag));
end
