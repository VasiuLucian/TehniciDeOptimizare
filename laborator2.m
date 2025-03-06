syms x;
f=x^2-4*x+5;
df=diff(f,x) 
%%
f=@(x) x.^2-4*x+5;
[x_min,f_min]=fminbnd(f,-10,10)
%%
c=[-1;-2]; %Functia obiectiv (maximizare-> se pune minus)
A=[1 1; -1 2]; %Matricea coeficientilor inegalitatilor
b=[4;2]; %Termenii din dreapta ai inegalitatilor
x=linprog(c,A,b)
%%
f=@(x) x(1)^2+x(2)^2;
x0=[1,1];
A=[];
b=[];
Aeq=[];
beq=[];
lb=[0,0];
ub=[2,2];
x_min=fmincon(f,x0,A,b,Aeq,beq,lb,ub)
%%
syms x y
f = x^2 + 3*x*y - y^2 + 5;
disp('Expresia simbolică f(x, y) este:');
disp(f);
%%
syms x
f = x^2 + 2*x + 1; % Definim o funcție simbolică
% Evaluăm funcția pentru x = 3
val = subs(f, x, 3);
disp('Valoarea expresiei pentru x = 3 este:');
disp(val);
%%
syms x
f = (x + 1)^2;
% Expansiunea expresiei
expanded_f = expand(f);
disp('Expresia expandată:');
disp(expanded_f);
% Simplificare
simplified_f = simplify(expanded_f);
disp('Expresia simplificată:');
disp(simplified_f);
%%
syms x
f = x^3 + 2*x^2 - 5*x + 4;
df = diff(f, x); % Derivata lui f(x) în raport cu x
disp('Derivata f(x) este:');
disp(df);
%%
syms x
f = x^2 + 3*x + 2;
int_f = int(f, x);
disp('Integrala f(x) este:');
disp(int_f);

%%
% Exemplu 6
syms x
eq = x^2 - 4*x + 3 == 0;
sol = solve(eq, x);
disp('Soluțiile ecuației sunt:');
disp(sol);
%%
clc; clear; close all;

% Definirea funcției
f = @(x) x.^4 - 6*x.^2 + 4*x + 12;

% Generarea valorilor pentru x
x = linspace(-3, 3, 1000);

% Calcularea valorilor funcției
y = f(x);

% Reprezentarea grafică
figure;
plot(x, y, 'b', 'LineWidth', 2); hold on;
xlabel('x');
ylabel('f(x)');
title('Identificarea minimelor locale și globale');
grid on;

% Identificarea minimelor locale folosind gradientul funcției
syms x_sym
f_sym = x_sym^4 - 6*x_sym^2 + 4*x_sym + 12;
df_sym = diff(f_sym); % Derivata funcției

% Găsirea punctelor critice (soluții pentru f'(x) = 0)
crit_points = double(solve(df_sym == 0, x_sym));

% Calculul valorilor funcției în punctele critice
f_crit = double(subs(f_sym, x_sym, crit_points));

% Afișarea minimelor pe grafic
plot(crit_points, f_crit, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');

% Determinarea minimului global într-un interval
[x_min, f_min] = fminbnd(f, -3, 3);
plot(x_min, f_min, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');

legend('f(x)', 'Minime locale', 'Minim global');
hold off;
%%
clc; clear; close all;

% Definirea funcției de două variabile
f = @(x, y) (1 - x).^2 + 100*(y - x.^2).^2;

% Definirea domeniului
x = linspace(-2, 2, 100);
y = linspace(-1, 3, 100);
[X, Y] = meshgrid(x, y);
Z = f(X, Y);

% Reprezentarea 3D a funcției
figure;
surf(X, Y, Z, 'EdgeColor', 'none');
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
title('Reprezentarea 3D a funcției Rosenbrock');
colorbar;
hold on;

% Determinarea minimului global folosind optimizare neliniară
x0 = [0, 0]; % Punct de start
[x_min, f_min] = fminunc(@(v) f(v(1), v(2)), x0);

% Marcarea minimului global pe grafic
plot3(x_min(1), x_min(2), f_min, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
legend('f(x, y)', 'Minim global');
hold off;
%%
% Definim x și funcția f(x)
x = linspace(-2, 2, 100);
f = x.^4 - 2*x.^2 + x;

% Găsim minimele locale
minime_locale = islocalmin(f);
x_min = x(minime_locale);
f_min = f(minime_locale);

% Găsim maximele locale
maxime_locale = islocalmax(f);
x_max = x(maxime_locale);
f_max = f(maxime_locale);

% Creăm graficul principal
figure
plot(x, f, 'b', 'LineWidth', 2) % Linie albastră pentru funcție
hold on

% Adăugăm punctele minime cu cercuri roșii
plot(x_min, f_min, 'ro', 'MarkerSize', 8, 'LineWidth', 2)

% Adăugăm punctele maxime cu cercuri verzi
plot(x_max, f_max, 'go', 'MarkerSize', 8, 'LineWidth', 2)

% Adăugăm grilă și etichete
grid on
xlabel('x')
ylabel('f(x)')
title('Funcția cu minime și maxime locale marcate')

% Adăugăm legendă
legend('f(x)', 'Minime locale', 'Maxime locale', 'Location', 'best')

hold off
%%
[X, Y] = meshgrid(linspace(-5, 5, 50), linspace(-5, 5, 50));
F = sin(X) .* cos(Y);
surf(X, Y, F)
xlabel('x')
ylabel('y')
zlabel('f(x, y)')
title('Funcția de două variabile cu multiple minime și maxime')
colormap jet
shading interp
% Găsim punctele de minim și maxim folosind islocalmin și islocalmax
minime_locale = islocalmin(F, 1) & islocalmin(F, 2);
maxime_locale = islocalmax(F, 1) & islocalmax(F, 2);

% Extragem coordonatele pentru minime și maxime
x_min = X(minime_locale);
y_min = Y(minime_locale);
f_min = F(minime_locale);

x_max = X(maxime_locale);
y_max = Y(maxime_locale);
f_max = F(maxime_locale);

hold on
plot3(x_min, y_min, f_min, 'ro', 'MarkerSize', 10, 'LineWidth', 2) % Minime roșii
plot3(x_max, y_max, f_max, 'go', 'MarkerSize', 10, 'LineWidth', 2) % Maxime verzi
legend('f(x, y)', 'Minime locale', 'Maxime locale', 'Location', 'best')
hold off
%%
% 1. Cream o grila de puncte X, Y pe intervalul [-5,5]
[x, y] = meshgrid(linspace(-5, 5, 100), linspace(-5, 5, 100));

% 2. Definim constanta A
A = 10;

% 3. Calculam valorile functiei Rastrigin pentru fiecare punct (x, y)
rastrigin = A * 2 + (x.^2 - A * cos(2 * pi * x)) + (y.^2 - A * cos(2 * pi * y));

% 4. Gasim minimele si maximele locale
minime_locale = islocalmin(rastrigin, 1) & islocalmin(rastrigin, 2);
maxime_locale = islocalmax(rastrigin, 1) & islocalmax(rastrigin, 2);
% 5. Extragem coordonatele pentru minime si maxime
x_min = x(minime_locale);
y_min = y(minime_locale);
f_min = rastrigin(minime_locale);

x_max = x(maxime_locale);
y_max = y(maxime_locale);
f_max = rastrigin(maxime_locale);

% 6. Afisam graficul 3D al functiei Rastrigin
figure;
surf(x, y, rastrigin, 'EdgeColor', 'none'); % Grafic 3D colorat
colormap jet; shading interp;
hold on;

% 7. Marcam minimele locale cu cercuri rosii
plot3(x_min, y_min, f_min, 'ro', 'MarkerSize', 10, 'LineWidth', 2);

% 8. Marcam maximele locale cu cercuri verzi
plot3(x_max, y_max, f_max, 'go', 'MarkerSize', 10, 'LineWidth', 2);

% 9. Setari pentru vizualizare
xlabel('X'); ylabel('Y'); zlabel('f(X,Y)');
title('Functia Rastrigin - Minime si Maxime locale');
legend('f(x, y)', 'Minime locale', 'Maxime locale', 'Location', 'best');
hold off;