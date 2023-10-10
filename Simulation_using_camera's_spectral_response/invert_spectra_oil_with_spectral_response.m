function [Thickness,xx]  = invert_spectra_oil_with_spectral_response(alpha,Rd,lambda_true,data,Spectral_response,incidence_angle,reflection_angle)

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

          
         
            Thickness(i)      = fmincon(@(a) Generate_spectra_and_compute_norm(data(:,i),Rd,lambda_true,Spectral_response,alpha,a,incidence_angle,reflection_angle), a_ini,...
                                 [],[],[],[],0,15000,[],options);   
                             
            [~,temp] = Generate_spectra_and_compute_norm(data(:,i),Rd,lambda_true,Spectral_response,alpha,Thickness(i),incidence_angle,reflection_angle);   
            xx(:,i) = remove_norm(temp);
                                
        end

end