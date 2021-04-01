function [cX] = calc_cX_4_7_28(L,rho,c_est,c_star,c0,del_x)
%calc_cX_4_7_13 Calculate c(X) according to equation 4.7.13


[func_comb]=integrate_trapz_manual(L,rho,c_est,c_star,del_x);
    

cX=c0*exp(func_comb);

end



function [func_comb]=integrate_trapz_manual(L,rho,c_est,c_star,del_x)

data_num = rho;
data_denom1 = L.*rho./(1-(c_star./c_est));
data_denom2= (c_star./c_est).*(L.*rho)./(1-(c_star./c_est));
        
for x=numel(L):-1:1
    
    if x==numel(L)
        func_num(x)     = 0;
        func_denom1(x)  = 0;
        func_denom2(x)  = 0;
        func_denom(x)   = 0;
        func_ratio(x)   = 0;
    else
        func_num(x)     = func_num(x+1) + del_x*(data_num(x+1) + data_num(x))/2;
        func_denom1(x)  = func_denom1(x+1) + del_x*(data_denom1(x+1) + data_denom1(x))/2;
        func_denom1(x)  = func_denom2(x+1) + del_x*(data_denom2(x+1) + data_denom2(x))/2;
        func_denom(x)   = func_denom1(x) + func_denom2(x);
        func_ratio(x)   = func_num(x) ./ func_denom(x);
    end
    
end


for x=1:numel(L)
    
    if x==1
        func_comb(x)     = 0;
        
    else
        func_comb(x)     = func_comb(x-1) + del_x*(func_ratio(x-1) + func_ratio(x))/2;
    end
end

end

