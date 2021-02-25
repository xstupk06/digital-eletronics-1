# 03-vivado
## Architecture of design
```vhdl
architecture Behavioral of mux_2bit_4to1 is
    begin
    f_o <= a_i when (sel_i ="00") else
    b_i when (sel_i ="00") else
    c_i when (sel_i ="00") else
    d_i;
    
   
  
 
    end architecture Behavioral;
```
## stimulus proccess
```vhdl
 beginning of stimulus process
        report "Stimulus process started" severity note;


        -- First test values
        s_d <= "00"; s_c <= "00";s_b <= "00"; s_a <= "00" ;
        s_sel <="00";wait for 100ns;
 
        s_d <= "10"; s_c <= "01";s_b <= "01"; s_a <= "00" ;
        s_sel <="00";wait for 100ns;
        
        s_d <= "10"; s_c <= "01";s_b <= "01"; s_a <= "11" ;
        s_sel <="00";wait for 100ns;
        
        s_d <= "10"; s_c <= "01";s_b <= "01"; s_a <= "00" ;
        s_sel <="01";wait for 100ns;
        
        s_d <= "10"; s_c <= "01";s_b <= "11"; s_a <= "00" ;
        s_sel <="01";wait for 100ns;



        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```
## Screenshot simulace
![1](images/simulace.PNG)
## Tutorial k Vivado
K založení nového projektu, potřeba kliknout v liště na File
![1](images/1.PNG)
Následně Project -> New
![1](images/2.PNG)
Klikneme na tlačítko Next
![1](images/3.PNG)
Zádname název projektu a cestu, kde se nám projekt uloží
![1](images/4.PNG)
Necháme zaškrnuté políčko RTL Project a pokračujeme tlačítkem Next
![1](images/5.PNG)
Zde klikneme na create File
![1](images/6.PNG)
Zvolíme typ souboru VHDL a zadáme název a potvrdíme tlačítkem ok
![1](images/7.PNG)
Zde zatím nic nepřidávame, tudíž odklikneme tlačítkem Next
![1](images/8.PNG)
Zde zatím nic nepřidávame, tudíž odklikneme tlačítkem Next
![1](images/9.PNG)
A Nakonec dáme Finish
![1](images/10.PNG)
K otevření pracovního prostoru 2x poklikáme na název designu, ktery jsme si zvolili
![1](images/11.PNG)
K přídání simulace nebo constrains slouží na levé straně tlačítko Add Sources
![1](images/12.PNG)
Vybere co chceme přidat a klikneme na Next
![1](images/13.PNG)
Klikneme na Create File
![1](images/14.PNG)
Zadáme opět Typ a jmeno souboru
![1](images/15.PNG)
A dáme finish
![1](images/16.PNG)
Potvrdíme tlačítkem OK
![1](images/17.PNG)
Simulaci spustíme opět na levě straně tlačítkem Start Simulation.