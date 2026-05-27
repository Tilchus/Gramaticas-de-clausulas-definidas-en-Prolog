% =================================================================
% ARCHIVO: reporte_consultas.pl
% MÓDULO: Automatización de Reportes
% =================================================================

% Lista de consultas
% Nota: La consulta 8 utiliza 'Arbol' como variable para capturar la estructura.
lista_consultas([
    [phrase(o, [el, empleado, trabaja, un, sueldo]), '1'],
    [phrase(o, [el, empleado, trabaja, una, empleada]), '2'],
    [phrase(o, [el, empleada, trabaja]), '3'],
    [phrase(o, [la, empleada, trabaja]), '4'],
    [phrase(o, [los, empleada, cobran, sueldos]), '5'],
    [phrase(o, [los, empleados, cobran, sueldos]), '6'],
    [phrase(o, [los, empleados, cobran, los, sueldos]), '7'],
    [phrase(o(Arbol), [los, empleados, cobran, los, sueldos]), '8'],
    [phrase(o, [los, empleados, trabajan, los, sueldos]), '9']
]).

% Regla principal de ejecución
% Utiliza forall para recorrer la lista y call para evaluar dinámicamente.
ejecutar_reporte :-
    write('--- INICIO DE REPORTE ---'), nl, nl,
    lista_consultas(Consultas),
    forall(member([Consulta, ID], Consultas), (
        write('Consulta '), write(ID), write(': '), write(Consulta), nl,
        evaluar_consulta(Consulta),
        nl, nl
    )),
    write('--- FIN DE LA EVALUACION ---'), nl.

% Lógica de evaluación para imprimir resultados
% Si es phrase(o(Arbol), ...), imprime el árbol. Si no, imprime TRUE/FALSE.
evaluar_consulta(Consulta) :-
    (call(Consulta) -> 
        ( (Consulta = phrase(o(Arbol), _)) -> 
            (write('Resultado: '), write(Arbol)) 
            ; write('Resultado: TRUE')
        )
        ; write('Resultado: FALSE')
    ).