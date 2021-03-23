# Lab 6: Driver for multiple seven-segment displays
## 1. Preparation tasks (done before the lab at home). Submit:
### Timing diagram figure for displaying value 3.142.
![1](images/1.PNG)
## 2.Display driver. Submit:
### Listing of VHDL code of the process p_mux with syntax highlighting.
```vhdl
p_mux : process(s_cnt, data0_i, data1_i, data2_i, data3_i, dp_i)
    begin
        case s_cnt is
            when "11" =>
                s_hex <= data3_i;
                dp_o  <= dp_i(3);
                dig_o <= "0111";

            when "10" =>
               s_hex <= data2_i;
                dp_o  <= dp_i(2);
                dig_o <= "1011";

            when "01" =>
                s_hex <= data1_i;
                dp_o  <= dp_i(1);
                dig_o <= "1101";

            when others =>
                s_hex <= data0_i;
                dp_o  <= dp_i(0);
                dig_o <= "1110";
        end case;
    end process p_mux;
```
### Listing of VHDL testbench file tb_driver_7seg_4digits with syntax highlighting and asserts
```vhdl
 p_stimulus : process
      begin
      
        s_data3_i <= "0011";
        s_data2_i <= "0001";
        s_data1_i <= "0100";
        s_data0_i <= "0010";
        s_dp_i    <= "0111";

        wait for 600 ns;
        
        s_data3_i <= "0000";
        s_data2_i <= "0001";
        s_data1_i <= "0000";
        s_data0_i <= "0001";
      
      
      wait;
      end process p_stimulus;
```
### Screenshot with simulated time waveforms; always display all inputs and outputs
![1](images/simulace.PNG)
### Listing of VHDL architecture of the top layer
```vhdl
architecture Behavioral of top is
    -- No internal signals
begin

    --------------------------------------------------------------------
    -- Instance (copy) of driver_7seg_4digits entity
    driver_seg_4 : entity work.driver_7seg_4digits
        port map(
            clk        => CLK100MHZ,
            reset      => BTNC,
            data0_i(3) => SW(3),
            data0_i(2) => SW(2),
            data0_i(1) => SW(1),
            data0_i(0) => SW(0),
            

            data1_i(3) => SW(7),
            data1_i(2) => SW(6),
            data1_i(1) => SW(5),
            data1_i(0) => SW(4),
            

            data2_i(3) => SW(11),
            data2_i(2) => SW(10),
            data2_i(1) => SW(9),
            data2_i(0) => SW(8),
            

            data3_i(3) => SW(15),
            data3_i(2) => SW(14),
            data3_i(1) => SW(13),
            data3_i(0) => SW(12),
            --- WRITE YOUR CODE HERE
            
            
            seg_o(0) => CA,
            seg_o(1) => CB,
            seg_o(2) => CC,
            seg_o(3) => CD,
            seg_o(4) => CE,
            seg_o(5) => CF,
            seg_o(6) => CG,
            
            
            dig_o => AN (4-1 downto 0),
            dp_i => "0111",
            dp_o => DP
            --- WRITE YOUR CODE HERE
        );

    -- Disconnect the top four digits of the 7-segment display
    AN(7 downto 4) <= b"1111";

end architecture Behavioral;
```
## 3.Eight-digit driver. Submit:
### Image of the driver schematic. The image can be drawn on a computer or by hand.
![1](images/schema.PNG)
