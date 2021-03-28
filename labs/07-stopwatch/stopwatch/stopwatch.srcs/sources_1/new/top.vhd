----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2021 12:11:09
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           BTND : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (1-1 downto 0);
           CA : out STD_LOGIC;
           CC : out STD_LOGIC;
           CE : out STD_LOGIC;
           CG : out STD_LOGIC;
           DP : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (8-1 downto 0));
end top;

architecture Behavioral of top is


    -- Local counters
    signal s_cnt3  : std_logic_vector(3 - 1 downto 0);
    signal s_cnt2  : std_logic_vector(4 - 1 downto 0);
    signal s_cnt1  : std_logic_vector(4 - 1 downto 0);
    signal s_cnt0  : std_logic_vector(4 - 1 downto 0);

begin
    --------------------------------------------------------------------
    -- Instance (copy) of stopwatch_seconds entity
    stopwatch_sec : entity work.stopwatch_seconds
        port map(
            clk   => CLK100MHZ,
            reset => BTNC,
            --- WRITE YOUR CODE HERE
       );

    --------------------------------------------------------------------
    -- Instance (copy) of driver_7seg_4digits entity
    driver_seg_4 : entity work.driver_7seg_4digits
        port map(
            clk                 => CLK100MHZ,
            reset               => BTNC,
            data3_i(3)          => '0',
            data3_i(2 downto 0) => s_cnt3,
            --- WRITE YOUR CODE HERE
        );

    -- Disconnect the top four digits of the 7-segment display
    AN(7 downto 4) <= b"1111";

end Behavioral;
