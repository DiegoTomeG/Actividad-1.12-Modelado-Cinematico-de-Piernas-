%Act 1.12: Modelado Cinemático de piernas
% -------- Tercer sistema ----------------

%Limpieza de pantalla
clear all
close all
clc

%Calculamos las matrices de transformación homogénea

% ------ Tercer sistema --------

% ------- Operaciones para punto de origen ---------
% Punto de origen primeramente lo posicionamos en el inicio del sistema
% segun la imagen propuesta
H0=SE3([0 6 6])
% Seguimos en el punto de origen pero tenemos que hacer una rotación de z 
% de -90 grados y una traslación de posición en la coordenada (x,y,z) de (0,6,6) 
% para posicionarlo como la imagen propuesta sin mover el sistema
H1=SE3(rotz(-pi/2), [0 6 6]); 

% ---------- Traslaciones ----------- 
H2=SE3([6 0 0]); % Traslación en x 
H3=SE3([0 0 -6]); % Traslación en z negativa
H4=SE3([0 3 0]) %Traslación en y 
H5=SE3([0 3 0]) %Traslación en y

H20= H1*H2;
H30= H20*H3 %Matriz de transformación homogenea global de 3 a 0 
H40= H30*H4
H50= H40*H5

%Coordenadas de la estructura de translación y rotación
x=[0 0 0 6];
y=[6 0 0 0];
z=[6 6 0 0];

plot3(x, y, z,'LineWidth', 1.5); axis([-1 7 -1 7 -1 7]); grid on;
hold on;

%Graficamos la trama absoluta o global 
trplot(H0,'rgb','axis', [-1 7 -1 7 -1 7])
% 
% %Realizamos una animación para la siguiente trama
 pause;
  tranimate(H0, H1,'rgb','axis', [-1 7 -1 7 -1 7])

% %Realizamos una animación para la siguiente trama
 pause;
 tranimate(H1, H20,'rgb','axis', [-1 7 -1 7 -1 7])

% % %Realizamos una animación para la siguiente trama
 pause;
  tranimate(H20, H30,'rgb','axis', [-1 7 -1 7 -1 7])
  disp(H30)

% % %Realizamos una animación para la siguiente trama
 pause;
  tranimate(H30, H40,'rgb','axis', [-1 7 -1 7 -1 7])
  disp(H40)

% % %Realizamos una animación para la siguiente trama
 pause;
  tranimate(H40, H50,'rgb','axis', [-1 7 -1 7 -1 7])
  disp(H50)