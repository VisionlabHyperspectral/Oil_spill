function [val,Spec] = Generate_spectra_and_compute_norm(data,Rd,lambda_true,response,alpha,a,incidence_angle,reflection_angle)

            if size(Rd,1)~=size(lambda_true,1)
    
               for j=1:size(lambda_true,1)   
    
                    Rd_Res(j,1) = gaussian_degradation_exact(Rd,response(:,j));   
                    data_Res(j,1) = gaussian_degradation_exact(data,response(:,j));
    
               end
    
    
            end
    
            library_data = exp(-(alpha.*a/cosd(incidence_angle)+alpha.*a/cosd(reflection_angle)));
    
            for j=1:size(lambda_true,1)            
                library_data_res(j,1) = gaussian_degradation_exact(library_data,response(:,j));      
    
            end
    
            Spec = Rd_Res.*library_data_res;

            val=norm(remove_norm(data_Res)-remove_norm(Spec))*10000;



end