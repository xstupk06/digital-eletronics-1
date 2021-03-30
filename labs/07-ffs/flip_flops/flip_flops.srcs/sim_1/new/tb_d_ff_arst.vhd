----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2021 13:54:39
-- Design Name: 
-- Module Name: tb_d_ff_arst - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_d_ff_arst is
--  Port ( );
end tb_d_ff_arst;

architecture Behavioral of tb_d_ff_arst is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    signal s_clk_100MHz    : std_logic;
    signal s_arst  : std_logic;
    signal s_d     : std_logic;
    signal s_q     : std_logic;
    signal s_qbar : std_logic;
    
begin
uut_d_ff_arst : entity work.d_ff_arst
 port map(
 clk     => s_clk_100MHz,
arst    => s_arst,
d       => s_d,
q       => s_q,
q_bar   => s_qbar
 );
 
 
 --Clock generation process
 
 p_clk_gen : process
begin
    while now < 40 ms loop
        s_clk_100MHz <= '0';
        wait for c_CLK_100MHZ_PERIOD / 2;
        s_clk_100MHz <= '1';
        wait for c_CLK_100MHZ_PERIOD / 2;
    end loop;
    wait;
end process p_clk_gen;

--------------------------------------------------------------------
-- Reset generation process
--------------------------------------------------------------------
p_reset_gen : process
begin
    s_arst <= '0';
    wait for 28 ns;
    
    -- Reset activated
    s_arst <= '1';
    wait for 13 ns;

    s_arst <= '0';
    wait for 17 ns;
    
    s_arst <= '1';
    wait for 33 ns;
    
    s_arst <= '1';
    
    
end process p_reset_gen;
--------------------------------------------------------------------
-- Data generation process
--------------------------------------------------------------------
p_stimulus : process
begin
    report "Stimulus process started" severity note;

    s_d <= '0';
    
    wait for 14 ns;
    s_d <= '1';
    wait for 5 ns;
        
    assert ((s_arst = '0') and (s_q = '1') and (s_q_bar = '0'))
    report "chyba" 
        severity error;
    wait for 5 ns;
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

    report "Stimulus process finished" severity note;
    wait;
end process p_stimulus;


end Behavioral;

