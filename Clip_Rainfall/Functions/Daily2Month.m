function [Month, MaxMonth, MinMonth, Year_cnt, Year]= Daily2Month(Daily,d1,m1,y1,d2,m2,y2,year_type)
%This function converts daily data to monthly data for a given data set.
Ans=year_type;
count=1;
if Ans== 'w'
    
    if d1==1 && m1==10 && ((d2==30 && m2==9)  || m2>10)
        Year    =[y1:1:y2]';
        Month   =zeros(12,y2-y1);
        MaxMonth=zeros(12,y2-y1);
        MinMonth=zeros(12,y2-y1);
        Year_cnt=zeros(length(Year)-1,1);
        for j=1:y2-y1
            for i=10:12
                if ((i==10)||(i==12))
                    Month(i-9,j)   =sum(Daily(count:count+30));
                    MaxMonth(i-9,j)=max(Daily(count:count+30));
                    MinMonth(i-9,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                else
                    Month(i-9,j)   =sum(Daily(count:count+29));
                    MaxMonth(i-9,j)=max(Daily(count:count+29));
                    MinMonth(i-9,j)=min(Daily(count:count+29));
                    count=count+30;
                    Year_cnt(j) = Year_cnt(j)+30;
                end
            end
            for i=1:9
                if ((i==1) ||(i==3)||(i==5)||(i==7)||(i==8))
                    Month(i+3,j)   =sum(Daily(count:count+30));
                    MaxMonth(i+3,j)=max(Daily(count:count+30));
                    MinMonth(i+3,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                elseif ((i==4) ||(i==6) || i==9)
                    Month(i+3,j)   =sum(Daily(count:count+29));
                    MaxMonth(i+3,j)=max(Daily(count:count+29));
                    MinMonth(i+3,j)=min(Daily(count:count+29));
                    count=count+30;
                    Year_cnt(j) = Year_cnt(j)+30;
                elseif i==2 && rem(Year(j+1), 4)==0 && Year(j+1)~=2100
                    Month(i+3,j)   =sum(Daily(count:count+28));
                    MaxMonth(i+3,j)=max(Daily(count:count+28));
                    MinMonth(i+3,j)=min(Daily(count:count+28));
                    count=count+29;
                    Year_cnt(j) = Year_cnt(j)+29;
                else
                    Month(i+3,j)   =sum(Daily(count:count+27));
                    MaxMonth(i+3,j)=max(Daily(count:count+27));
                    MinMonth(i+3,j)=min(Daily(count:count+27));
                    count=count+28;
                    Year_cnt(j) = Year_cnt(j)+28;
                end
            end
        end
    elseif d1==1 && m1==10 && ((d2~=30 && m2==9)  || m2<10)
        Year    =[y1:1:y2-1]';
        Month   =zeros(12,y2-y1-1);
        MaxMonth=zeros(12,y2-y1-1);
        MinMonth=zeros(12,y2-y1-1);
        Year_cnt=zeros(length(Year)-1,1);
        for j=1:y2-y1-1
            for i=10:12
                if ((i==10)||(i==12))
                    Month(i-9,j)=sum(Daily(count:count+30));
                    MaxMonth(i-9,j)=max(Daily(count:count+30));
                    MinMonth(i-9,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                else
                    Month(i-9,j)=sum(Daily(count:count+29));
                    MaxMonth(i-9,j)=max(Daily(count:count+29));
                    MinMonth(i-9,j)=min(Daily(count:count+29));
                    count=count+30;
                    Year_cnt(j) = Year_cnt(j)+30;
                end
            end
            for i=1:9
                if ((i==1) ||(i==3)||(i==5)||(i==7)||(i==8))
                    Month(i+3,j)=sum(Daily(count:count+30));
                    MaxMonth(i+3,j)=max(Daily(count:count+30));
                    MinMonth(i+3,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                elseif ((i==4) ||(i==6) || i==9)
                    Month(i+3,j)=sum(Daily(count:count+29));
                    MaxMonth(i+3,j)=max(Daily(count:count+29));
                    MinMonth(i+3,j)=min(Daily(count:count+29));
                    count=count+30;
                    Year_cnt(j) = Year_cnt(j)+30;
                elseif i==2 && rem(Year(j+1), 4)==0 && Year(j+1)~=2100
                    Month(i+3,j)=sum(Daily(count:count+28));
                    MaxMonth(i+3,j)=max(Daily(count:count+28));
                    MinMonth(i+3,j)=min(Daily(count:count+28));
                    count=count+29;
                    Year_cnt(j) = Year_cnt(j)+29;
                else
                    Month(i+3,j)=sum(Daily(count:count+27));
                    MaxMonth(i+3,j)=max(Daily(count:count+27));
                    MinMonth(i+3,j)=min(Daily(count:count+27));
                    count=count+28;
                    Year_cnt(j) = Year_cnt(j)+28;
                end
            end
        end
        
    elseif  m1<10 && (d2==30 && m2==9)
        Year    =[y1:1:y2]';
        Month   =zeros(12,y2-y1);
        MaxMonth=zeros(12,y2-y1);
        MinMonth=zeros(12,y2-y1);
        Year_cnt=zeros(length(Year)-1,1);
        if ((m1==1) || (m1==3) || (m1==5) || (m1==7) || (m1==8))
            count=32-d1;
            for i= (m1+1):9
                if ((i==3) || (i==5) || (i==7) || (i==8))
                    count=count+31;
                elseif ((i==4) || (i==6) || (i==9))
                    count=count+30;
                elseif rem(y1,4)==0 && y1~=2100
                    count=count+29;
                else
                    count=count+28;
                end
            end
        elseif ((m1==4) || (m1==6) || (m1==9))
            count=31-d1;
            for i= (m1+1):9
                if ((i==5) || (i==7) || (i==8))
                    count=count+31;
                elseif ((i==6) || (i==9))
                    count=count+30;
                elseif rem(y1,4)==0 && y1~=2100
                    count=count+29;
                else
                    count=count+28;
                end
            end
        else
            if rem(y1,4)==0 && y1~=2100
                count=30-d1;
                for i= (m1+1):9
                    if ((i==3) || (i==5) || (i==7) || (i==8))
                        count=count+31;
                    elseif ((i==4) || (i==6) || (i==9))
                        count=count+30;
                    end
                end
            else
                count=29-d1;
                for i= (m1+1):9
                    if ((i==3) || (i==5) || (i==7) || (i==8))
                        count=count+31;
                    elseif ((i==4) || (i==6) || (i==9))
                        count=count+30;
                    end
                end
            end
        end
        count=count+1;
        for j=1:y2-y1
            for i=10:12
                if ((i==10)||(i==12))
                    Month(i-9,j)   =sum(Daily(count:count+30));
                    MaxMonth(i-9,j)=max(Daily(count:count+30));
                    MinMonth(i-9,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                else
                    Month(i-9,j)   =sum(Daily(count:count+29));
                    MaxMonth(i-9,j)=max(Daily(count:count+29));
                    MinMonth(i-9,j)=min(Daily(count:count+29));
                    count=count+30;
                    Year_cnt(j) = Year_cnt(j)+30;
                end
            end
            for i=1:9
                if ((i==1) ||(i==3)||(i==5)||(i==7)||(i==8))
                    Month(i+3,j)   =sum(Daily(count:count+30));
                    MaxMonth(i+3,j)=max(Daily(count:count+30));
                    MinMonth(i+3,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                elseif ((i==4) ||(i==6) || i==9)
                    Month(i+3,j)   =sum(Daily(count:count+29));
                    MaxMonth(i+3,j)=max(Daily(count:count+29));
                    MinMonth(i+3,j)=min(Daily(count:count+29));
                    count=count+30;
                    Year_cnt(j) = Year_cnt(j)+30;
                elseif i==2 && rem(Year(j+1), 4)==0 && Year(j+1)~=2100
                    Month(i+3,j)   =sum(Daily(count:count+28));
                    MaxMonth(i+3,j)=max(Daily(count:count+28));
                    MinMonth(i+3,j)=min(Daily(count:count+28));
                    count=count+29;
                    Year_cnt(j) = Year_cnt(j)+29;
                else
                    Month(i+3,j)   =sum(Daily(count:count+27));
                    MaxMonth(i+3,j)=max(Daily(count:count+27));
                    MinMonth(i+3,j)=min(Daily(count:count+27));
                    count=count+28;
                    Year_cnt(j) = Year_cnt(j)+28;
                end
            end
        end
        
    elseif  m1<10 && (d2~=30 && m2==9 || m2<9)
        if ((m1==1) || (m1==3) || (m1==5) || (m1==7) || (m1==8))
            count=32-d1;
            for i= (m1+1):9
                if ((i==3) || (i==5) || (i==7) || (i==8))
                    count=count+31;
                elseif ((i==4) || (i==6) || (i==9))
                    count=count+30;
                elseif rem(y1,4)==0 && y1~=2100
                    count=count+29;
                else
                    count=count+28;
                end
            end
        elseif ((m1==4) || (m1==6) || (m1==9))
            count=31-d1;
            for i= (m1+1):9
                if ((i==5) || (i==7) || (i==8))
                    count=count+31;
                elseif ((i==6) || (i==9))
                    count=count+30;
                elseif rem(y1,4)==0 && y1~=2100
                    count=count+29;
                else
                    count=count+28;
                end
            end
        else
            if rem(y1,4)==0 && y1~=2100
                count=30-d1;
                for i= (m1+1):9
                    if ((i==3) || (i==5) || (i==7) || (i==8))
                        count=count+31;
                    elseif ((i==4) || (i==6) || (i==9))
                        count=count+30;
                    end
                end
            else
                count=29-d1;
                for i= (m1+1):9
                    if ((i==3) || (i==5) || (i==7) || (i==8))
                        count=count+31;
                    elseif ((i==4) || (i==6) || (i==9))
                        count=count+30;
                    end
                end
            end
        end
        count=count+1;
        Year    =[y1:1:y2-1]';
        Month   =zeros(12,y2-y1-1);
        MaxMonth=zeros(12,y2-y1-1);
        MinMonth=zeros(12,y2-y1-1);
        Year_cnt=zeros(length(Year)-1,1);
        for j=1:y2-y1-1
            for i=10:12
                if i==10
                    Month(1,j)   =sum(Daily(count:count+30));
                    MaxMonth(1,j)=max(Daily(count:count+30));
                    MinMonth(1,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                elseif i==11
                    Month(2,j)   =sum(Daily(count:count+29));
                    MaxMonth(2,j)=max(Daily(count:count+29));
                    MinMonth(2,j)=min(Daily(count:count+29));
                    count=count+30;
                    Year_cnt(j) = Year_cnt(j)+30;
                else
                    Month(3,j)   =sum(Daily(count:count+30));
                    MaxMonth(3,j)=max(Daily(count:count+30));
                    MinMonth(3,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                end
            end
            for i=1:9
                if ((i==1) ||(i==3)||(i==5)||(i==7)||(i==8))
                    Month(i+3,j)   =sum(Daily(count:count+30));
                    MaxMonth(i+3,j)=max(Daily(count:count+30));
                    MinMonth(i+3,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                elseif ((i==4) ||(i==6) || i==9)
                    Month(i+3,j)   =sum(Daily(count:count+29));
                    MaxMonth(i+3,j)=max(Daily(count:count+29));
                    MinMonth(i+3,j)=min(Daily(count:count+29));
                    count=count+30;
                    Year_cnt(j) = Year_cnt(j)+30;
                elseif i==2 && rem(Year(j+1), 4)==0 && Year(j+1)~=2100
                    Month(i+3,j)   =sum(Daily(count:count+28));
                    MaxMonth(i+3,j)=max(Daily(count:count+28));
                    MinMonth(i+3,j)=min(Daily(count:count+28));
                    count=count+29;
                    Year_cnt(j) = Year_cnt(j)+29;
                else
                    Month(i+3,j)   =sum(Daily(count:count+27));
                    MaxMonth(i+3,j)=max(Daily(count:count+27));
                    MinMonth(i+3,j)=min(Daily(count:count+27));
                    count=count+28;
                    Year_cnt(j) = Year_cnt(j)+28;
                end
            end
        end
        
    elseif   m1<10 && ((d2==30 && m2==9) || m2>9)
        if ((m1==1) || (m1==3) || (m1==5) || (m1==7) || (m1==8))
            count=32-d1;
            for i= (m1+1):9
                if ((i==3) || (i==5) || (i==7) || (i==8))
                    count=count+31;
                elseif ((i==4) || (i==6) || (i==9))
                    count=count+30;
                elseif rem(y1,4)==0 && y1~=2100
                    count=count+29;
                else
                    count=count+28;
                end
            end
        elseif ((m1==4) || (m1==6) || (m1==9))
            count=31-d1;
            for i= (m1+1):9
                if ((i==5) || (i==7) || (i==8))
                    count=count+31;
                elseif ((i==6) || (i==9))
                    count=count+30;
                elseif rem(y1,4)==0 && y1~=2100
                    count=count+29;
                else
                    count=count+28;
                end
            end
        else
            if rem(y1,4)==0 && y1~=2100
                count=30-d1;
                for i= (m1+1):9
                    if ((i==3) || (i==5) || (i==7) || (i==8))
                        count=count+31;
                    elseif ((i==4) || (i==6) || (i==9))
                        count=count+30;
                    end
                end
            else
                count=29-d1;
                for i= (m1+1):9
                    if ((i==3) || (i==5) || (i==7) || (i==8))
                        count=count+31;
                    elseif ((i==4) || (i==6) || (i==9))
                        count=count+30;
                    end
                end
            end
        end
        count=count+1;
        Year    =[y1:1:y2]';
        Month   =zeros(12,y2-y1-1);
        MaxMonth=zeros(12,y2-y1-1);
        MinMonth=zeros(12,y2-y1-1);
        Year_cnt=zeros(length(Year)-1,1);
        for j=1:y2-y1
            for i=10:12
                if i==10
                    Month(1,j)   =sum(Daily(count:count+30));
                    MaxMonth(1,j)=max(Daily(count:count+30));
                    MinMonth(1,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                elseif i==11
                    Month(2,j)   =sum(Daily(count:count+29));
                    MaxMonth(2,j)=max(Daily(count:count+29));
                    MinMonth(2,j)=min(Daily(count:count+29));
                    count=count+30;
                    Year_cnt(j) = Year_cnt(j)+30;
                else
                    Month(3,j)   =sum(Daily(count:count+30));
                    MaxMonth(3,j)=max(Daily(count:count+30));
                    MinMonth(3,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                end
            end
            for i=1:9
                if ((i==1) ||(i==3)||(i==5)||(i==7)||(i==8))
                    Month(i+3,j)   =sum(Daily(count:count+30));
                    MaxMonth(i+3,j)=max(Daily(count:count+30));
                    MinMonth(i+3,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                elseif ((i==4) ||(i==6) || i==9)
                    Month(i+3,j)   =sum(Daily(count:count+29));
                    MaxMonth(i+3,j)=max(Daily(count:count+29));
                    MinMonth(i+3,j)=min(Daily(count:count+29));
                    count=count+30;
                    Year_cnt(j) = Year_cnt(j)+30;
                elseif i==2 && rem(Year(j+1), 4)==0 && Year(j+1)~=2100
                    Month(i+3,j)   =sum(Daily(count:count+28));
                    MaxMonth(i+3,j)=max(Daily(count:count+28));
                    MinMonth(i+3,j)=min(Daily(count:count+28));
                    count=count+29;
                    Year_cnt(j) = Year_cnt(j)+29;
                else
                    Month(i+3,j)   =sum(Daily(count:count+27));
                    MaxMonth(i+3,j)=max(Daily(count:count+27));
                    MinMonth(i+3,j)=min(Daily(count:count+27));
                    count=count+28;
                    Year_cnt(j) = Year_cnt(j)+28;
                end
            end
        end        
        
    elseif   (m1>10 || (m1==10 && d1~=1)) && ((d2==30 && m2==9) || m2>9)
        Year    =[y1+1:1:y2]';
        Month   =zeros(12,y2-y1-1);
        MaxMonth=zeros(12,y2-y1-1);
        MinMonth=zeros(12,y2-y1-1);
        Year_cnt=zeros(length(Year)-1,1);
        if m1==10
            count=32-d1+30+31;
        elseif m1==11
            count=31-d1+31;
        else
            count=32-d1;
        end
        if(rem((y1+1),4)==0) && (y1+1)~=2100
            count=5*31+3*30+count+29;
        else
            count=5*31+3*30+count+28;
        end
        count=count+1;
        for j=1:y2-y1-1
            for i=10:12
                if ((i==10)||(i==12))
                    Month(i-9,j)   =sum(Daily(count:count+30));
                    MaxMonth(i-9,j)=max(Daily(count:count+30));
                    MinMonth(i-9,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                else
                    Month(i-9,j)   =sum(Daily(count:count+29));
                    MaxMonth(i-9,j)=sum(Daily(count:count+29));
                    MinMonth(i-9,j)=sum(Daily(count:count+29));
                    count=count+30;
                    Year_cnt(j) = Year_cnt(j)+30;
                end
            end
            for i=1:9
                if ((i==1) ||(i==3)||(i==5)||(i==7)||(i==8))
                    Month(i+3,j)   =sum(Daily(count:count+30));
                    MaxMonth(i+3,j)=max(Daily(count:count+30));
                    MinMonth(i+3,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                elseif ((i==4) ||(i==6) || i==9)
                    Month(i+3,j)   =sum(Daily(count:count+29));
                    MaxMonth(i+3,j)=max(Daily(count:count+29));
                    MinMonth(i+3,j)=min(Daily(count:count+29));
                    count=count+30;
                    Year_cnt(j) = Year_cnt(j)+30;
                elseif i==2 && rem(Year(j+1),4)==0 && Year(j+1)~=2100
                    Month(i+3,j)   =sum(Daily(count:count+28));
                    MaxMonth(i+3,j)=max(Daily(count:count+28));
                    MinMonth(i+3,j)=min(Daily(count:count+28));
                    count=count+29;
                    Year_cnt(j) = Year_cnt(j)+29;
                else
                    Month(i+3,j)   =sum(Daily(count:count+27));
                    MaxMonth(i+3,j)=max(Daily(count:count+27));
                    MinMonth(i+3,j)=min(Daily(count:count+27));
                    count=count+28;
                    Year_cnt(j) = Year_cnt(j)+28;
                end
            end
        end
    elseif   (m1>10 || (m1==10 && d1~=1)) && ((d2~=30 && m2==9) || m2<9)
        Year    =[y1+1:1:y2-1]';
        Month   =zeros(12,y2-y1-2);
        MinMonth=zeros(12,y2-y1-2);
        MaxMonth=zeros(12,y2-y1-2);
        Year_cnt=zeros(length(Year)-1,1);
        if m1==10
            count=32-d1+30+31;
        elseif m1==11
            count=31-d1+31;
        else
            count=32-d1;
        end
        if(rem((y1+1),4)==0) && (y1+1)~=2100
            count=5*31+3*30+count+29;
        else
            count=5*31+3*30+count+28;
        end
        count=count+1;
        for j=1:y2-y1-2
            for i=10:12
                if ((i==10)||(i==12))
                    Month(i-9,j)   =sum(Daily(count:count+30));
                    MaxMonth(i-9,j)=max(Daily(count:count+30));
                    MinMonth(i-9,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                else
                    Month(i-9,j)   =sum(Daily(count:count+29));
                    MaxMonth(i-9,j)=max(Daily(count:count+29));
                    MinMonth(i-9,j)=min(Daily(count:count+29));
                    count=count+30;
                    Year_cnt(j) = Year_cnt(j)+30;
                end
            end
            for i=1:9
                if ((i==1) ||(i==3)||(i==5)||(i==7)||(i==8))
                    Month(i+3,j)   =sum(Daily(count:count+30));
                    MaxMonth(i+3,j)=max(Daily(count:count+30));
                    MinMonth(i+3,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                elseif ((i==4) ||(i==6) || i==9)
                    Month(i+3,j)   =sum(Daily(count:count+29));
                    MaxMonth(i+3,j)=max(Daily(count:count+29));
                    MinMonth(i+3,j)=min(Daily(count:count+29));
                    count=count+30;
                    Year_cnt(j) = Year_cnt(j)+30;
                elseif i==2 && rem(Year(j+1),4)==0 && Year(j+1)~=2100
                    Month(i+3,j)   =sum(Daily(count:count+28));
                    MaxMonth(i+3,j)=max(Daily(count:count+28));
                    MinMonth(i+3,j)=min(Daily(count:count+28));
                    count=count+29;
                    Year_cnt(j) = Year_cnt(j)+29;
                else
                    Month(i+3,j)   =sum(Daily(count:count+27));
                    MaxMonth(i+3,j)=max(Daily(count:count+27));
                    MinMonth(i+3,j)=min(Daily(count:count+27));
                    count=count+28;
                    Year_cnt(j) = Year_cnt(j)+28;
                end
            end
        end
    end
else
    
    if d1==1 && m1==1 && d2==31 && m2==12
        Year    =[y1:1:y2]';
        Month   =zeros(12,y2-y1+1);
        MaxMonth=zeros(12,y2-y1+1);
        MinMonth=zeros(12,y2-y1+1);
        Year_cnt=zeros(length(Year),1);
        for j=1:y2-y1+1
            for i=1:12
                if ((i==1) ||(i==3)||(i==5)||(i==7)||(i==8)||(i==10)||(i==12))
                    Month(i,j)   =sum(Daily(count:count+30));
                    MaxMonth(i,j)=max(Daily(count:count+30));
                    MinMonth(i,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                elseif ((i==4) ||(i==6)||(i==9)||(i==11))
                    Month(i,j)   =sum(Daily(count:count+29));
                    MaxMonth(i,j)=max(Daily(count:count+29));
                    MinMonth(i,j)=min(Daily(count:count+29));
                    count=count+30;
                    Year_cnt(j) = Year_cnt(j)+30;
                elseif i==2 && rem(Year(j),4)==0 && Year(j)~=2100
                    Month(i,j)   =sum(Daily(count:count+28));
                    MaxMonth(i,j)=max(Daily(count:count+28));
                    MinMonth(i,j)=min(Daily(count:count+28));
                    count=count+29;
                    Year_cnt(j) = Year_cnt(j)+29;
                else
                    Month(i,j)   =sum(Daily(count:count+27));
                    MaxMonth(i,j)=max(Daily(count:count+27));
                    MinMonth(i,j)=min(Daily(count:count+27));
                    count=count+28;
                    Year_cnt(j) = Year_cnt(j)+28;
                end
            end
        end
        
    elseif d1==1 && m1==1 && ((m2==12 && d2<31) ||  m2<12)
        Year    =[y1:1:y2-1]';
        Month   =zeros(12,y2-y1);
        MaxMonth=zeros(12,y2-y1);
        MinMonth=zeros(12,y2-y1);
        Year_cnt=zeros(length(Year),1);
        for j=1:y2-y1
            for i=1:12
                if ((i==1) ||(i==3)||(i==5)||(i==7)||(i==8)||(i==10)||(i==12))
                    Month(i,j)   =sum(Daily(count:count+30));
                    MaxMonth(i,j)=max(Daily(count:count+30));
                    MinMonth(i,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                elseif ((i==4) ||(i==6)||(i==9)||(i==11))
                    Month(i,j)   =sum(Daily(count:count+29));
                    MaxMonth(i,j)=max(Daily(count:count+29));
                    MinMonth(i,j)=min(Daily(count:count+29));
                    count=count+30;
                    Year_cnt(j) = Year_cnt(j)+30;
                elseif i==2 && (rem(Year(j),4)==0) &&  Year(j)~=2100
                    Month(i,j)   =sum(Daily(count:count+28));
                    MaxMonth(i,j)=max(Daily(count:count+28));
                    MinMonth(i,j)=min(Daily(count:count+28));
                    count=count+29;
                    Year_cnt(j) = Year_cnt(j)+29;
                else
                    Month(i,j)   =sum(Daily(count:count+27));
                    MaxMonth(i,j)=max(Daily(count:count+27));
                    MinMonth(i,j)=min(Daily(count:count+27));
                    count=count+28;
                    Year_cnt(j) = Year_cnt(j)+28;
                end
            end
        end
        
        
    elseif d2==31 && m2==12 && ((d1~=1 && m1==1) || m1~=1)
        Year    =[y1+1:1:y2]';
        Month   =zeros(12,y2-y1);
        MaxMonth=zeros(12,y2-y1);
        MinMonth=zeros(12,y2-y1);
        Year_cnt=zeros(length(Year),1);
        if ((m1==1) || (m1==3) || (m1==5) || (m1==7) || (m1==8) || (m1==10) || (m1==12))
            count=32-d1;
            for i= (m1+1):12
                if ((i==3)||(i==5)||(i==7)||(i==8) || (i==10) || (i==12))
                    count=count+31;
                elseif ((i==4) ||(i==6)||(i==9) || (i==11))
                    count=count+30;
                elseif rem(y1,4)==0 && y1~=2100
                    count=count+29;
                else
                    count=count+28;
                end
            end
        elseif ((m1==4) || (m1==6) || (m1==9)  || (m1==11))
            count=31-d1;
            for i= (m1+1):12
                if ((i==5) || (i==7) || (i==8) || (i==10) || (i==12))
                    count=count+31;
                elseif ((i==6) || (i==9) || (i==11))
                    count=count+30;
                end
            end
        else
            if rem(y1,4)==0 && y1~=2100
                count=30-d1;
                for i= (m1+1):12
                    if ((i==5) || (i==7) || (i==8) || (i==10) || (i==12))
                        count=count+31;
                    elseif ((i==4) || (i==6) || (i==9) || (i==11))
                        count=count+30;
                    end
                end
            else
                count=29-d1;
                for i= (m1+1):12
                    if ((i==5) || (i==7) || (i==8) || (i==10) || (i==12))
                        count=count+31;
                    elseif ((i==4) || (i==6) || (i==9) || (i==11))
                        count=count+30;
                    end
                end
            end
        end
        count=count+1;
        for j=1:y2-y1
            for i=1:12
                if ((i==1) || (i==3) || (i==5) || (i==7) || (i==8) || (i==10) || (i==12))
                    Month(i,j)   =sum(Daily(count:count+30));
                    MaxMonth(i,j)=max(Daily(count:count+30));
                    MinMonth(i,j)=min(Daily(count:count+30));
                    count=count+31;
                    Year_cnt(j) = Year_cnt(j)+31;
                elseif ((i==4) ||(i==6)||(i==9)||(i==11))
                    Month(i,j)   =sum(Daily(count:count+29));
                    MaxMonth(i,j)=max(Daily(count:count+29));
                    MinMonth(i,j)=min(Daily(count:count+29));
                    count=count+30;
                    Year_cnt(j) = Year_cnt(j)+30;
                elseif i==2 && (rem(Year(j),4)==0) && Year(j)~=2100
                    Month(i,j)   =sum(Daily(count:count+28));
                    MaxMonth(i,j)=max(Daily(count:count+28));
                    MinMonth(i,j)=min(Daily(count:count+28));
                    count=count+29;
                    Year_cnt(j) = Year_cnt(j)+29;
                else
                    Month(i,j)=sum(Daily(count:count+27));
                    MaxMonth(i,j)=max(Daily(count:count+27));
                    MinMonth(i,j)=min(Daily(count:count+27));
                    count=count+28;
                    Year_cnt(j) = Year_cnt(j)+28;
                end
            end
        end
        
    elseif ((d2~=31 && m2==12) || m2~=12) && ((d1~=1 && m1==1) || m1~=1)
        Year    =[y1+1:1:y2-1]';
        Month   =zeros(12,y2-y1-1);
        MaxMonth=zeros(12,y2-y1-1);
        MinMonth=zeros(12,y2-y1-1);
        Year_cnt=zeros(length(Year),1);
        if ((m1==1) || (m1==3) || (m1==5) || (m1==7) || (m1==8) || (m1==10) || (m1==12))
            count=32-d1;
            for i= (m1+1):12
                if ((i==3) || (i==5) || (i==7) || (i==8) || (i==10) || (i==12))
                    count=count+31;
                elseif ((i==4) || (i==6) || (i==9) || (i==11))
                    count=count+30;
                elseif rem(y1,4)==0 && y1~=2100
                    count=count+28;
                else
                    count=count+28;
                end
            end
        elseif ((m1==4) || (m1==6) || (m1==9)  || (m1==11))
            count=31-d1;
            for i= (m1+1):12
                if ((i==5) || (i==7) || (i==8) || (i==10) || (i==12))
                    count=count+31;
                elseif ((i==6) || (i==9) || (i==11))
                    count=count+30;
                end
            end
        else
            if rem(y1,4)==0 && y1~=2100
                count=29-d1;
                for i= (m1+1):12
                    if ((i==3) || (i==5)||(i==7)||(i==8) || (i==10) || (i==12))
                        count=count+31;
                    elseif ((i==4) ||(i==6)||(i==9) || (i==11))
                        count=count+30;
                    end
                end
            else
                count=29-d1;
                for i= (m1+1):12
                    if ((i==3) || (i==5)|| (i==7) || (i==8) || (i==10) || (i==12))
                        count=count+31;
                    elseif ((i==4) ||(i==6) || (i==9)  ||(i==11))
                        count=count+30;
                    end
                end
            end
        end
        count=count+1;
        for j=1:y2-y1-1
            for i=1:12
                if ((i==1) ||(i==3)||(i==5)||(i==7)||(i==8)||(i==10)||(i==12))
                    Month(i,j)   =sum(Daily(count:count+30));
                    MaxMonth(i,j)=max(Daily(count:count+30));
                    MinMonth(i,j)=min(Daily(count:count+30));
                    count=count+31;
                     Year_cnt(j) = Year_cnt(j)+31;
                elseif ((i==4) ||(i==6)||(i==9)||(i==11))
                    Month(i,j)   =sum(Daily(count:count+29));
                    MaxMonth(i,j)=max(Daily(count:count+29));
                    MinMonth(i,j)=min(Daily(count:count+29));
                    count=count+30;
                    Year_cnt(j) = Year_cnt(j)+30;
                elseif  i==2 && (rem(Year(j),4)==0) && Year(j)~=2100
                    Month(i,j)   =sum(Daily(count:count+28));
                    MaxMonth(i,j)=max(Daily(count:count+28));
                    MinMonth(i,j)=min(Daily(count:count+28));
                    count=count+29;
                    Year_cnt(j) = Year_cnt(j)+29;
                else
                    Month(i,j)   =sum(Daily(count:count+27));
                    MaxMonth(i,j)=max(Daily(count:count+27));
                    MinMonth(i,j)=min(Daily(count:count+27));
                    count=count+28;
                    Year_cnt(j) = Year_cnt(j)+28;
                end
            end
        end
    end
end
end

