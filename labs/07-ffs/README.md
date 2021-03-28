# 07-ffs
## 1.Preparation tasks (done before the lab at home). Submit
### Characteristic equations and completed tables for D, JK, T flip-flops.
<!--
\begin{align*}
    q_{n+1}^D =&~ \\
    q_{n+1}^{JK} =&\\
    q_{n+1}^T =&\\
\end{align*}-->

   | **clk** | **d** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](Images/eq_uparrow.png) | 0 | 0 |  |  |
   | ![rising](Images/eq_uparrow.png) | 0 | 1 |  |  |
   | ![rising](Images/eq_uparrow.png) | 1 |  |  |  |
   | ![rising](Images/eq_uparrow.png) | 1 |  |  |  |

   | **clk** | **j** | **k** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-: | :-- |
   | ![rising](Images/eq_uparrow.png) | 0 | 0 | 0 | 0 | No change |
   | ![rising](Images/eq_uparrow.png) | 0 | 0 | 1 | 1 | No change |
   | ![rising](Images/eq_uparrow.png) | 0 |  |  |  |  |
   | ![rising](Images/eq_uparrow.png) | 0 |  |  |  |  |
   | ![rising](Images/eq_uparrow.png) | 1 |  |  |  |  |
   | ![rising](Images/eq_uparrow.png) | 1 |  |  |  |  |
   | ![rising](Images/eq_uparrow.png) | 1 |  |  |  |  |
   | ![rising](Images/eq_uparrow.png) | 1 |  |  |  |  |

   | **clk** | **t** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](Images/eq_uparrow.png) | 0 | 0 |  |  |
   | ![rising](Images/eq_uparrow.png) | 0 | 1 |  |  |
   | ![rising](Images/eq_uparrow.png) | 1 |  |  |  |
   | ![rising](Images/eq_uparrow.png) | 1 |  |  |  |


<!--
## 2.D latch. Submit
### VHDL code listing of the process p_d_latch with syntax highlighting
```vhdl
p_d_latch : process (d, arst, en)
begin
    if (arst='1') then
        q     <= '0';
        q_bar <= '1';
    elsif (en ='1') then
       q      <= d; 
       q_bar  <= not d;
    end if;
  end process p_d_latch;
```
### Listing of VHDL reset and stimulus processes from the testbench tb_d_latch.vhd file with syntax highlighting and asserts
```vhdl
  p_reset_gen : process
  begin
    s_arst <= '0';
    wait for 53 ns;
    
    
    wait for 1 ns;
     assert(s_q = '0' and s_qbar = '1')
    report "Výpis chyby2" severity error;
   
    
    s_arst <= '1';
    wait for 5 ns;
    
    s_arst <= '0';
    
    wait for 108 ns;
     s_arst <= '1';
  
    wait;
    end process p_reset_gen;



p_stimulus :process
    begin
        report"Stimulus processs started" severity note;
        
    s_en  <= '0';
    s_d   <= '0';
    
    
    wait for 10 ns;    
    s_d <= '1';
     wait for 10 ns;    
    s_d <= '0';
     wait for 10 ns;    
    s_d <= '1';
     wait for 10 ns;    
    s_d <= '0';
     wait for 10 ns;    
    s_d <= '1';
    wait for 10 ns;    
    s_d <= '0';
    

    
    wait for 10 ns;  
     
     
    s_en <= '1';
    
    wait for 3 ns;
    assert(s_q = '0' and s_qbar = '1')
    report "Chyba" severity error;
     
       
    wait for 7 ns;    
    s_d <= '1';
     wait for 10 ns;    
    s_d <= '0';
     wait for 10 ns;    
    s_d <= '1';
     wait for 10 ns;    
    s_d <= '0';
     wait for 10 ns;    
    s_d <= '1';
    wait for 10 ns;    
    s_d <= '0';
    wait for 10 ns;  
     
     s_en <= '0';
     
    wait for 10 ns;    
    s_d <= '1';
     wait for 10 ns;    
    s_d <= '0';
     wait for 10 ns;    
    s_d <= '1';
     wait for 10 ns;    
    s_d <= '0';
     wait for 10 ns;    
    s_d <= '1';
    wait for 10 ns;    
    s_d <= '0';
    wait for 10 ns;  
     
     s_en <= '1';
     
    wait for 10 ns;    
    s_d <= '1';
     wait for 10 ns;    
    s_d <= '0';
     wait for 10 ns;    
    s_d <= '1';
     wait for 10 ns;    
    s_d <= '0';
     wait for 10 ns;    
    s_d <= '1';
    wait for 10 ns;    
    s_d <= '0';
    wait for 10 ns;  
     

    wait for 10 ns;    
    s_d <= '1';
     wait for 10 ns;    
    s_d <= '0';
     wait for 10 ns;    
    s_d <= '1';
     wait for 10 ns;    
    s_d <= '0';
     wait for 10 ns;    
    s_d <= '1';
    wait for 10 ns;    
    s_d <= '0';
    wait for 10 ns;  
    
    wait;
    end process p_stimulus;
```
### Screenshot with simulated time waveforms; always display all inputs and outputs. The full functionality of the entity must be verified.
[Images/simulace.png]
## 3.Flip-flops. Submit:
### Image of the shift register schematic. The image can be drawn on a computer or by hand. Name all inputs, outputs, components and internal signals.