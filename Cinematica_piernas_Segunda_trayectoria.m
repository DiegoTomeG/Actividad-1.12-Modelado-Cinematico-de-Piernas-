%Act 1.12: Modelado Cinemático de piernas
% -------- Segundo sistema ----------------

%Limpieza de pantalla
clear all
close all
clc

%Calculamos las matrices de transformación homogénea

% ------ Segundo sistema --------

H0=SE3; %Punto de origen
H1=SE3(rotx(pi/2), [0 0 2.5]); % Rotar en x 90 grados positivos y Traslación en z
H2=SE3(rotz(pi/2), [0 2.5 0]); % Rotar en z 90 grados positivos y Traslación en y
H3=SE3(rotz(-pi/2),[0 -1 0]) % Rotar en z 90 grados negativos y Traslación en y negativa
H4=SE3(rotz(pi/2)*rotx(pi/2), [2 0 0]) % Rotar en z 90 grados positivos junto con Rotar en x 90 grados positivos y Traslación en x
H5=SE3([0 0 2]) % Traslación en z

H20= H1*H2;
H30= H20*H3 %Matriz de transformación homogenea global de 3 a 0 
H40= H30*H4
H50= H40*H5

%Coordenadas de la estructura de translación y rotación
x=[5 0 0];
y=[0 0 0];
z=[5 5 0];

plot3(x, y, z,'LineWidth', 1.5); axis([-1 6 -1 6 -1 6]); grid on;
hold on;

%Graficamos la trama absoluta o global 
trplot(H0,'rgb','axis', [-1 6 -1 6 -1 6])
% 
% %Realizamos una animación para la siguiente trama
 pause;
  tranimate(H0, H1,'rgb','axis', [-1 6 -1 6 -1 6])

% %Realizamos una animación para la siguiente trama
 pause;
 tranimate(H1, H20,'rgb','axis', [-1 6 -1 6 -1 6])

% % %Realizamos una animación para la siguiente trama
 pause;
  tranimate(H20, H30,'rgb','axis', [-1 6 -1 6 -1 6])
  disp(H30)

% % %Realizamos una animación para la siguiente trama
 pause;
  tranimate(H30, H40,'rgb','axis', [-1 6 -1 6 -1 6])
  disp(H40)

% % %Realizamos una animación para la siguiente trama
 pause;
  tranimate(H40, H50,'rgb','axis', [-1 6 -1 6 -1 6])
  disp(H50)