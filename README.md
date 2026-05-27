🎯 Analizador Sintáctico en Prolog
Proyecto desarrollado para la cátedra de Técnicas de Procesamiento del Habla del Instituto Tecnológico Beltrán. Implementa un sistema de Gramáticas de Cláusulas Definidas (DCG) para la validación gramatical basada en concordancia de género y número.

📂 Estructura de archivos
📄 KBTrabajo_Practico_Gramaticas_BaseDeConocimiento1.pl: Archivo principal con el léxico y las reglas gramaticales.

⚙️ reporte consultas.pl: Módulo automatizado para ejecutar pruebas y extraer árboles sintácticos.

📝 Gramaticas definidas en prolog 11.pdf: Informe técnico detallado sobre la metodología y resultados.

🚀 Cómo ejecutar el sistema
Para correr el proyecto en SWI-Prolog, seguí estos tres pasos:

1. Carga la base de conocimiento:
?- consult('KBTrabajo_Practico_Gramaticas_BaseDeConocimiento1.pl').

2. Carga el módulo de reporte:
?- consult('reporte consultas.pl').

3. Ejecuta la auditoría completa:
?- ejecutar_reporte.

📊 Resultados del reporte
Al ejecutar ejecutar_reporte., el sistema procesará las pruebas automáticamente:

✅ VALICACIÓN: Determina si cada oración es correcta (TRUE) o incorrecta (FALSE).

🌳 EXTRACCIÓN: Genera la estructura del árbol sintáctico en las consultas habilitadas.

🔍 AUDITORÍA: Imprime los resultados en consola para una verificación rápida.

Proyecto desarrollado por Silvana Alejandra Gerez.
Cátedra: Técnicas de Procesamiento del Habla - 2026.
