% Static force analysis of Mitchell Topology of Order 4
% By Bingran Wang, PID:A53313500
clc; close all
clear; clf; figure(1);

phi=pi/8;
beta=pi/6;
r(:,1)=1;
p(:,1)=r(:,1)*sin(phi)/sin(beta+phi);
for i=1:4
    r(:,i+1)=r(:,i)*sin(beta)/sin(beta+phi);
end

%Fixed nodes location
P(:,1)=[0;-r(5)];
P(:,2)=[sin(2*phi)*r(5);-cos(2*phi)*r(5)];
P(:,3)=[r(5);0];
P(:,4)=[sin(2*phi)*r(5);cos(2*phi)*r(5)];
P(:,5)=[0;r(5)];

%Free nodes location
Q(:,1)=[sin(phi)*r(4);-cos(phi)*r(4)];
Q(:,2)=[cos(phi)*r(4);-sin(phi)*r(4)];
Q(:,3)=[cos(phi)*r(4);sin(phi)*r(4)];
Q(:,4)=[sin(phi)*r(4);cos(phi)*r(4)];
Q(:,5)=[sin(2*phi)*r(:,3);-cos(2*phi)*r(:,3)];
Q(:,6)=[r(:,3);0];
Q(:,7)=[sin(2*phi)*r(:,3);cos(2*phi)*r(:,3)];
Q(:,8)=[cos(phi)*r(:,2);-sin(phi)*r(:,2)];
Q(:,9)=[cos(phi)*r(:,2);sin(phi)*r(:,2)];
Q(:,10)=[r(:,1);0];

[dim,q]=size(Q), p=size(P,2),n=q+p;

%bars
C(1,1)=1; C(1,11)=-1;
C(2,5)=1; C(2,1)=-1;
C(3,8)=1; C(3,5)=-1;
C(4,10)=1; C(4,8)=-1;
C(5,2)=1; C(5,12)=-1;
C(6,6)=1; C(6,2)=-1;
C(7,9)=1; C(7,6)=-1;
C(8,3)=1; C(8,13)=-1;
C(9,7)=1; C(9,3)=-1;
C(10,4)=1; C(10,14)=-1;
b=10;
%strings
C(11,1)=1; C(11,12)=-1;
C(12,5)=1; C(12,2)=-1;
C(13,8)=1; C(13,6)=-1;
C(14,10)=1; C(14,9)=-1;
C(15,2)=1; C(15,13)=-1;
C(16,6)=1; C(16,3)=-1;
C(17,9)=1; C(17,7)=-1;
C(18,3)=1; C(18,14)=-1;
C(19,7)=1; C(19,4)=-1;
C(20,4)=1; C(20,15)=-1;
s=10;
m=b+s;
% Apply External Force
U(1:dim,1:10)=0; U(2,10)=10;
% Solve for the forces at equilibrium, and plot
[c_bars,t_strings,V]=tensegrity_statics(b,s,q,p,dim,Q,P,C,U);
tensegrity_plot(Q,P,C,b,s,U,V,true,1.0); grid on;