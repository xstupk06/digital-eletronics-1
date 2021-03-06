# Cvičení první 01-gates
## Odkaz na github
https://github.com/xstupk06
## Odkaz na playground De Morgan laws

https://www.edaplayground.com/x/umsg

## Zadání de Morgan
![Zadání 1](images/zadani1.gif)
### Kod pro de Morgan laws
```vhdl
-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
entity gates is
	port(
    	a_i	: in std_logic;
        b_i	: in std_logic;
        c_i : in std_logic;
        fnand_o	: out std_logic;
       -- fand_o	: out std_logic;
      	fnor_o	: out std_logic;
        f_o : out std_logic
    	);
    end entity gates;
    architecture dataflow of gates is
    begin
   -- for_o <= a_i or b_i;
   -- fand_o <= a_i and b_i;
    --fxor_o <= a_i xor b_i;
    f_o<= ((not b_i) and a_i) or ((not c_i) and (not b_i));
    fnand_o <= not (not (not b_i and a_i) and not(not b_i and not c_i));
    fnor_o <= (not(b_i or (not a_i))) or(not(c_i or b_i));
    end architecture dataflow;
```
## Screen simulace de Morgan laws
![Simulace](images/demorgan.PNG)
## Výsledná tabulka
| **c** | **b** |**a** | **f(c,b,a)** | **f(c,b,a)NAND** | **f(c,b,a)NOR** |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 1 |1 | 1 |
| 0 | 0 | 1 | 1 |1 | 1 |
| 0 | 1 | 0 | 0 |0 | 0 |
| 0 | 1 | 1 | 0 |0 | 0 |
| 1 | 0 | 0 | 0 |0 | 0 |
| 1 | 0 | 1 | 1 |1 | 1 |
| 1 | 1 | 0 | 0 |0 | 0 |
| 1 | 1 | 1 | 0 |0 | 0 |

## Zadání pro Distributive laws
Potvrdit zda se rovnice rovanají
>![Simulace](images/zadani2.png) 
### Kod pro druhou čast
```vhdl
library IEEE;
use IEEE.std_logic_1164.all;
entity gates is
	port(
    	a_i	: in std_logic;
        b_i	: in std_logic;
        c_i : in std_logic;
        f1_o	: out std_logic;
        f2_o	: out std_logic;
      	f3_o	: out std_logic;
        f4_o 	: out std_logic
    	);
    end entity gates;
    architecture dataflow of gates is
    begin
   -- for_o <= a_i or b_i;
   -- fand_o <= a_i and b_i;
    --fxor_o <= a_i xor b_i;
    f1_o <= ((a_i and b_i)or(a_i and c_i));
	f2_o <= (a_i and (b_i or c_i));
	f3_o <= ((a_i or b_i) and (a_i or c_i));
	f4_o <= (a_i or (b_i and c_i));
    end architecture dataflow;
```
## Screenshot pro Distributive laws
![Simulace](images/2cast.PNG)    
## Odkaz na playground Distributive laws
https://www.edaplayground.com/x/ht96