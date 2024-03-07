
%% IMD Maximum Temperature data Conversion


f=fopen('mergedmaximumtemperature.GRD','rb');         %open grd file
z1=[];                                      %create empty group file
for i=1:26298                        %time(days)
    for j=1:31                             %longtitude
        for k=1:31                       %latitude
            a(i,j,k)=fread(f,1,'float32'); 
        end                                 
    end                                     
    z(:,:,:)=a(i,:,:);                      
    z1=[z1;z];                              
    clear z                                 
end   
maxtemp_new= cell(26298,1);
[maxtemp_new{:}]=  deal(zeros(31,31));
for i =1:26298
x= z1(i,:,:);
maxtemp_new{i}= reshape(x, [], 31);
end

%% data format for PET calculation

for i =1:size(maxtemp_new,1)
    maxtemp_me{i,1}= flip(maxtemp_new{i,1});
end
maxtemp = cell(31,31);
[maxtemp{:}]=  deal(zeros(size(maxtemp_me,1),1));
for i =1:31
for k =1:31
for j = 1:size(maxtemp_me,1)
tr(j,1) = maxtemp_me{j,1}(i,k);
end
maxtemp{i,k}(:,1)= tr;
end
end

%% save the data
save maxtemp maxtemp


%% IMD Minimum Temperature data Conversion

f=fopen('mergedminimumtemperature.GRD','rb');         %open grd file
z1=[];                                      %create empty group file
for i=1:26298                        %time(days)
    for j=1:31                             %longtitude
        for k=1:31                       %latidue
            a(i,j,k)=fread(f,1,'float32'); 
        end                                 
    end                                     
    z(:,:,:)=a(i,:,:);                      
    z1=[z1;z];                              
    clear z                                 
end   
mintemp_new= cell(26298,1);
[mintemp_new{:}]=  deal(zeros(31,31));
for i =1:26298
x= z1(i,:,:);
mintemp_new{i}= reshape(x, [], 31);
end

%% data format for PET calculation

for i =1:size(mintemp_new,1)
    mintemp_me{i,1}= flip(mintemp_new{i,1});
end
mintemp = cell(31,31);
[mintemp{:}]=  deal(zeros(size(mintemp_me,1),1));
for i =1:31
for k =1:31
for j = 1:size(mintemp_me,1)
tr(j,1) = mintemp_me{j,1}(i,k);
end
mintemp{i,k}(:,1)= tr;
end
end

%% save the data
save mintemp mintemp