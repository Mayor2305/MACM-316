clc
clear
close all

a=1;
b=2;
area=a*b;
a = [1:10;2:11;3:12];

tempfunc(2,3,4)

function[area] = tempfunc(a,b,c)
area=a*b*c;
end