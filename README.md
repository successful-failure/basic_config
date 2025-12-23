# Zsh Config

# VIM

# regex

Vim utiliza una sintaxis de regex que es muy similar a la de Perl o PCRE (Perl Compatible Regular Expressions), pero tiene algunas particularidades. Aquí te presento algunos de los metacaracteres más comunes:

. (Punto): Coincide con cualquier carácter excepto un salto de línea.

ca.a coincide con "casa", "caba", "cana", etc.

* (Asterisco): Coincide con cero o más ocurrencias del carácter o grupo anterior.

ab*c coincide con "ac", "abc", "abbc", "abbbc", etc.

\+ (Signo Más escapado): Coincide con una o más ocurrencias del carácter o grupo anterior. (Ten en cuenta que + necesita ser escapado en Vim por defecto, a menos que uses el modo "very magic").

ab\+c coincide con "abc", "abbc", "abbbc", pero no con "ac".

\? (Signo de Interrogación escapado): Coincide con cero o una ocurrencia del carácter o grupo anterior.

colou\?r coincide con "color" y "colour".

^ (Circunflejo): Coincide con el inicio de la línea.

^Hola coincide con líneas que empiezan con "Hola".

$ (Signo de Dólar): Coincide con el final de la línea.

mundo$ coincide con líneas que terminan con "mundo".

[] (Corchetes): Coincide con cualquier carácter dentro de los corchetes. Puedes especificar rangos.

[aeiou] coincide con cualquier vocal.

[0-9] coincide con cualquier dígito.

[a-zA-Z] coincide con cualquier letra mayúscula o minúscula.

[^] (Corchetes con Circunflejo): Coincide con cualquier carácter que NO esté dentro de los corchetes.

[^0-9] coincide con cualquier carácter que no sea un dígito.

\| (Barra Vertical escapada): Actúa como un "O" lógico.

gato\|perro coincide con "gato" o "perro".

() (Paréntesis): Se usan para agrupar patrones o para capturar subcadenas.

(ab)\+ coincide con "ab", "abab", "ababab", etc.

\b (Límite de Palabra): Coincide con el límite de una palabra.

\bcat\b coincide con la palabra "cat" completa, pero no con "cats" o "caterpillar".

\w (Carácter de Palabra): Coincide con cualquier letra, número o guion bajo (_). Es equivalente a [a-zA-Z0-9_].

\d (Dígito): Coincide con cualquier dígito (0-9). Es equivalente a [0-9].

\s (Espacio en Blanco): Coincide con cualquier carácter de espacio en blanco (espacio, tabulación, salto de línea, etc.).

\., \*, \+, \?, \[, \], \(, \), \$, \^, \\: Para que los metacaracteres coincidan con su valor literal, necesitas escaparlos con una barra invertida (\). Por ejemplo, para buscar un punto literal, usarías \..

## Teclas especiales

<leader>: tecla especial ( configurable, DEFAULT ' \ ' ) que evita conflictos con atajos predeterminados.

<CR> : es un atajo que lee vim para simular que el usuario presiono enter.

<Esc> : para simular que el usuario uso ESC.

<A-n> : ( siendo n cualquier letra ) para usar Alt en la conbinacion.

<S-n>  o SHIFT : (siendo n cualquier letra) para representar la tecla shift o si usas una vocal simplemente usa su version mayuscula ( E I Y U D ).

<C-n> : ( siendo n cualquier letra ) para el uso de la tecla Ctrl. 

<Tab> : tab

<Down>,<Right>... : para el uso de flachas.

## MAPPING

> WARNING: Siempre usa el :[n]noremap en todas sus variantes a menos que lo requieras especificamente.

:map:
    Todos los modos (normal, visual, operador, pendiente)
    Este es el mapeo genérico y recursivo. Es útil para atajos simples, pero puede causar problemas si un mapeo se refiere a otro.

:noremap
    Todos los modos	Es la versión no recursiva de :map. Esto significa que si mapeas j a k y luego k a l, :noremap solo usará la primera asignación.
    Es el comando más seguro y recomendado para la mayoría de los casos.

[NORMAL MODE]
:nmap
    Solo crea un mapeo para el modo normal. También es recursivo.

:nnoremap
    La versión no recursiva y más segura para el modo normal.

[VISUAL MODE]
:vmap
    Solo crea un mapeo para los modos visuales y recursivo.

:vnoremap
    La versión no recursiva y más segura para el modo visual.

[INSERT MODE]
:imap
    Solo crea un mapeo para el modo insertar y recursivo.

:inoremap
    La versión no recursiva y más segura para el modo insertar.

[COMMAND MODE]
:cmap
    Solo crea un mapeo para la línea de comandos y recursivo.

:cnoremap
    La versión no recursiva y más segura para la línea de comandos.


