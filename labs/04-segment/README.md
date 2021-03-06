# 04-Segment
## 1. Preparation tasks (done before the lab at home). Submit
![1](images/NexysLed.PNG)
### Figure or table with connection of 7-segment displays on Nexys A7 board
### Decoder truth table for common anode 7-segment display.
| Hex | Inputs | A | B | C | D | E | F | G |
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0000 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
| 1 | 0001 | 1 | 0 | 0 | 1 | 1 | 1 | 1 |
| 2 | 0010 | 0 | 0 | 1 | 0 | 0 | 1 | 0 |
| 3 | 0011 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| 4 | 0100 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 
| 5 | 0101 | 0 | 1 | 0 | 0 | 1 | 0 | 0 |
| 6 | 0110 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| 7 | 0111 | 0 | 0 | 1 | 1 | 1 | 1 | 1 |
| 8 | 1000 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 9 | 1001 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |
| A | 1010 | 0 | 0 | 0 | 1 | 0 | 0 | 0 |
| b | 1011 | 1 | 1 | 0 | 0 | 0 | 0 | 0 |
| C | 1100 | 0 | 1 | 1 | 0 | 0 | 0 | 1 |
| d | 1101 | 1 | 0 | 0 | 0 | 0 | 1 | 0 |
| E | 1110 | 0 | 1 | 1 | 0 | 0 | 0 | 0 |
| F | 1111 | 0 | 1 | 1 | 1 | 0 | 0 | 0 |

## 2. Seven-segment display decoder. Submit:
### Listing of VHDL architecture from source file hex_7seg.vhd with syntax highlighting,
```vhdl
architecture Behavioral of hex_7seg is

begin

    p_7seg_decoder : process(hex_i)
    begin
        case hex_i is
            when "0000" =>
                seg_o <= "0000001";     -- 0
                
            when "0001" =>
                seg_o <= "1001111";     -- 1
                
            when "0010" =>
                seg_o <= "0010010";     -- 2
                
            when "0011" =>
                seg_o <= "0000110";     -- 3
                
            when "0100" =>
                seg_o <= "1001100";     -- 4
                
            when "0101" =>
                seg_o <= "0100100";     -- 5
                
            when "0110" =>
                seg_o <= "0100000";     -- 6
                
            when "0111" =>
                seg_o <= "0001111";     -- 7
                
            when "1000" =>
                seg_o <= "0000000";     -- 8
                
            when "1001" =>
                seg_o <= "0000100";     -- 9
                
            when "1010" =>
                seg_o <= "0001000";     -- A
                
            when "1011" =>
                seg_o <= "1100000";     -- b
                
            when "1100" =>
                seg_o <= "1001110";     -- C
                
            when "1101" =>
                seg_o <= "0111101";     -- d
    
            when "1110" =>
                seg_o <= "0110000";     -- E
            when others =>
                seg_o <= "0111000";     -- F
        end case;
    end process p_7seg_decoder;
```
### Listing of VHDL stimulus process from testbench file tb_hex_7seg.vhd with syntax highlighting
```vhdl
p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;


        s_hex <= "0000"; wait for 100 ns;   --0
        s_hex <= "0001"; wait for 100 ns;   --1
        s_hex <= "0010"; wait for 100 ns;   --2
        s_hex <= "0011"; wait for 100 ns;   --3
        s_hex <= "0100"; wait for 100 ns;   --4
        s_hex <= "0101"; wait for 100 ns;   --5
        s_hex <= "0110"; wait for 100 ns;   --6
        s_hex <= "0111"; wait for 100 ns;   --7
        s_hex <= "1000"; wait for 100 ns;   --8
        s_hex <= "1001"; wait for 100 ns;   --9
        s_hex <= "1010"; wait for 100 ns;   --a
        s_hex <= "1011"; wait for 100 ns;   --b
        s_hex <= "1100"; wait for 100 ns;   --c
        s_hex <= "1101"; wait for 100 ns;   --d
        s_hex <= "1110"; wait for 100 ns;   --e
        s_hex <= "1111"; wait for 100 ns;   --f
       
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end Behavioral;


```
### Screenshot with simulated time waveforms; always display all inputs and outputs

![1](images/simulace.PNG)
### Listing of VHDL code from source file top.vhd with 7-segment module instantiation.
```vhdl


```