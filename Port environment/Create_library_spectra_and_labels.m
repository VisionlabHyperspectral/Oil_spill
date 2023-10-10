function [Input,Output]  = Create_library_spectra_and_labels(alpha,Background,lambda_true,response,incidence_angle,reflection_angle)
        
        Rd_res = mean(Background,2);
        
        t=linspace(1,15000,15000);
        
        library_data_diesel = exp(-(alpha(:,1).*t/cosd(incidence_angle)+alpha(:,1).*t/cosd(reflection_angle)));
        library_data_Smeerolie = exp(-(alpha(:,2).*t/cosd(incidence_angle)+alpha(:,2).*t/cosd(reflection_angle)));
        library_data_Stookolie = exp(-(alpha(:,3).*t/cosd(incidence_angle)+alpha(:,3).*t/cosd(reflection_angle)));
        library_data_Hydrauliek = exp(-(alpha(:,4).*t/cosd(incidence_angle)+alpha(:,4).*t/cosd(reflection_angle)));
        
        library_data = [library_data_diesel,library_data_Smeerolie,library_data_Stookolie,library_data_Hydrauliek];
               
        for i=1:size(library_data,2)
            for j=1:size(lambda_true,1)            
            library_data_res(j,i) = gaussian_degradation_exact(library_data(:,i),response(:,j));        
            end
        end
        
        library_data = Rd_res.*library_data_res;

        
        Input = [Background,library_data];
        
        I=eye(2);     
       
        
       Output = [I(:,1).*ones(1,size(Background,2)),I(:,2).*ones(1,size(library_data,2))];
        
end