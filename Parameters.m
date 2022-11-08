rng(0,'twister');

%%------------------------------Parameters-------------------------------%%
consumers = 1405;
consumer_no = 45;
lambda_0 = 21;
p = 43.63;
n = 0.4;
q = 1287;
mean_d = 7;
var_d = 3.5*3.5;
mean_e = -0.8;
var_e = 0.1*0.1;

%%-------------------------Normal Distributions--------------------------%%
d = mean_d + sqrt(var_d).*randn(consumers,1);
e = mean_e + sqrt(var_e).*randn(consumers,1);
W = 0;
for i = 1:consumers
    W = W + d(i)*lambda_0^e(i);
end
E = e(consumer_no);
D = W/(lambda_0^E);

G_w = D*E*lambda_0^(E-1);
G_s = p;
a = 2*n/(G_s - G_w);

s_0 = q;
w_0 = D*(1-E)*lambda_0^E;
b_k = 0.289;
B = s_0 - w_0 - b_k;
%%--------------------------------Plots----------------------------------%%
figure(1)
plot(dd);
xlabel('consumer');
hold on;
plot(e);
hold off;
legend('Dj','Ej');