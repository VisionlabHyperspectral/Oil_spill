function [Thickness,xx]  = invert_spectra_oil(alpha,Rd,data)

        % alpha = oil absorption spectral coefficient in mum-1
        % Rd = reflectance of background
        % data = spectra of oil+background
        % xx = Reconstructed spectra
 
        [~,N]               = size(data);
        
         
        % Optimizer settings
        options             = optimset('fmincon');
        options             = optimset(options,'Display','off','Algorithm',...
                                       'sqp','MaxFunEvals',50000,'TolFun',...
                                       1e-10,'TolCon',1e-8,'GradObj','off');
         
        Rd=remove_norm(Rd);
        for i=1:N
            a_ini           =  10; % epsilon, L Initialize with mean of 
                                            % endmembers
                   
            % The function we want to minimize is the reconstruction error between
            % the observed and modeled spectrum.

          
         
            Thickness(i)      = fmincon(@(a) norm(remove_norm(data(:,i))- remove_norm(Rd.*exp(-(alpha.*a/cosd(35)+alpha.*a/cosd(12)))))*10000, a_ini,...
                                 [],[],[],[],0,15000,[],options);   
                             
            xx(:,i) = remove_norm(Rd.*exp(-(alpha.*Thickness(i)/cosd(35)+alpha.*Thickness(i)/cosd(12))));               
                                
        end

end