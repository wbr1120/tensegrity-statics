% Static force analysis of Mitchell Topology of Order 4
% By Bingran Wang, PID:A53313500
clc; close all
clear; figure(1);

Q(:,1) = [1,1,0];
Q(:,2) = [1,-1,0];
Q(:,3) = [-1,-1,0];
Q(:,4) = [-1,1,0];

Q(:,5) = [sqrt(2),0,1];
Q(:,6) = [0,-sqrt(2),1];
Q(:,7) = [-sqrt(2),0,1];
Q(:,8) = [0,sqrt(2),1];
P=[];
[dim,q]=size(Q), p=size(P,2),n=q+p;

%Connectivity Matrix
%bars
C(1,1)=1; C(1,6)=-1;
C(2,2)=1; C(2,7)=-1;
C(3,3)=1; C(3,8)=-1;
C(4,4)=1; C(4,5)=-1;
b=4;
%strings
C(b+1,1)=1; C(b+1,2)=-1;
C(b+2,2)=1; C(b+2,3)=-1;
C(b+3,3)=1; C(b+3,4)=-1;
C(b+4,1)=1; C(b+4,4)=-1;

C(b+5,1)=1; C(b+5,5)=-1;
C(b+6,1)=1; C(b+6,8)=-1;
C(b+7,2)=1; C(b+7,5)=-1;
C(b+8,2)=1; C(b+8,6)=-1;
C(b+9,3)=1; C(b+9,6)=-1;
C(b+10,3)=1; C(b+10,7)=-1;
C(b+11,4)=1; C(b+11,7)=-1;
C(b+12,4)=1; C(b+12,8)=-1;

C(b+13,5)=1; C(b+13,6)=-1;
C(b+14,6)=1; C(b+14,7)=-1;
C(b+15,7)=1; C(b+15,8)=-1;
C(b+16,5)=1; C(b+16,8)=-1;
s=16;
m=b+s;
U(1:dim,1:8)=0; 
for i=1:4
    U(3,i)   = -1;
    U(3,4+i) = +1;
end
[c_bars,t_strings,V]=tensegrity_statics(b,s,q,p,dim,Q,P,C,U);
tensegrity_plot(Q,P,C,b,s,U,V,true,1.0); grid on;






