----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2026 06:44:52 PM
-- Design Name: 
-- Module Name: Timed_Table_Tb - Behavioral
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

entity Timed_Table_Tb is
--  Port ( );
end Timed_Table_Tb;

architecture Behavioral of Timed_Table_Tb is

component Timed_Platform is
    Port ( Clk_System_Loc, Reset_Loc : in STD_LOGIC;
           Cathode_7SD_Loc, Anode_7SD_Loc : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal Clk_Sys_tb, Reset_tb : STD_LOGIC;
signal Cathode_7SD_tb, Anode_7SD_tb : STD_LOGIC_VECTOR(7 downto 0);
constant Clock_100Mhz_Period: time := 10ns;
begin

    tt: Timed_Platform Port map(Clk_System_Loc => Clk_Sys_tb,
                                Reset_Loc => Reset_tb,
                                Cathode_7SD_Loc => Cathode_7SD_tb,
                                Anode_7SD_Loc => Anode_7SD_tb);
    
Clk_process: process
    begin
        Clk_Sys_tb <= '0'; wait for Clock_100Mhz_Period/2;
        Clk_Sys_tb <= '1'; wait for Clock_100Mhz_Period/2;
    end process;
    
    stim_process: process
        begin
            Reset_tb <= '1';
        wait for 50ns;
            Reset_tb <= '0';
        wait for 50ns;
     end process;


end Behavioral;
