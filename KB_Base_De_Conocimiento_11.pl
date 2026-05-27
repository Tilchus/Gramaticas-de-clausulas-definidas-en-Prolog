% =====================================================================
% TRABAJO PRÁCTICO:Gramáticas de cláusulas definidas(DCG) EN PROLOG 
% Alumna: Silvana Alejandra Gerez
% Cátedra: Técnicas de Procesamiento del Habla
% =====================================================================

% ---------------------------
%  BASE DE CONOCIMIENTO 
% ---------------------------

det(masculino, singular, el) --> [el].
det(masculino, singular, un) --> [un].
det(masculino, plural, los)   --> [los].
det(masculino, plural, unos)   --> [unos].
det(femenino, singular, la)  --> [la].
det(femenino, singular, una)  --> [una].
det(femenino, plural, las)    --> [las].
det(femenino, plural, unas)    --> [unas].

sust(masculino, singular, empleado) --> [empleado].
sust(femenino, singular, empleada)  --> [empleada].
sust(masculino, plural, empleados)   --> [empleados].
sust(femenino, plural, empleadas)    --> [empleadas].
sust(masculino, singular, sueldo)    --> [sueldo].
sust(masculino, plural, sueldos)     --> [sueldos].

vi(singular, trabaja) --> [trabaja].
vi(plural, trabajan)   --> [trabajan].

vt(singular, cobra) --> [cobra].
vt(plural, cobran)   --> [cobran].


% -------------------------
% REGLAS DE PRODUCCIÓN 
% -------------------------

% Regla base sin argumentos (para responder true/false con 'phrase(o, ...)')
o --> sn(N, _), sv(N, _).

% Regla con argumento (para extraer la estructura del árbol sintáctico)
o(oracion(ArbolSN, ArbolSV)) --> sn(N, ArbolSN), sv(N, ArbolSV).

% Sintagma Nominal Sujeto: Valida estrictamente Género (G) y Número (N)
sn(N, sn(det(D), sust(S))) --> det(G, N, D), sust(G, N, S).

% Sintagma Nominal Complemento (Objeto Directo):
% El objeto DEBE tener determinante (D) y sustantivo (S),
% y ambos deben coincidir en su propio Género (G2) y Número (N2).
sn_comp(sn_comp(det(D), sust(S))) --> det(G2, N2, D), sust(G2, N2, S).

% Sintagma Verbal: Conecta el verbo con el sujeto usando el Número (N)
sv(N, sv(vi(V))) --> vi(N, V).
sv(N, sv(vt(V), ArbolComp)) --> vt(N, V), sn_comp(ArbolComp).