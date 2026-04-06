----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2026 06:12:03 PM
-- Design Name: 
-- Module Name: Timed_Platform - Behavioral
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

entity Timed_Platform is
    Port ( Clk_System_Loc, Reset_Loc : in STD_LOGIC;
           Cathode_7SD_Loc, Anode_7SD_Loc : out STD_LOGIC_VECTOR (7 downto 0));
end Timed_Platform;

architecture Behavioral of Timed_Platform is

signal presentState : STD_LOGIC_VECTOR (5 downto 0) := "000000";
signal nextState : STD_LOGIC_vector (5 downto 0);
    
    
begin

process (Clk_System_Loc, Reset_Loc)
    begin
        if Reset_Loc = '1' then
        presentState <= "000000";
        elsif rising_edge(Clk_System_Loc) then
        presentState <= nextState;
        end if;
    end process;
    
    Cathode_7SD_Loc <= "11111101";
    Anode_7SD_Loc <= "1111" & presentState(3 downto 0);
    nextState <= "010000" when presentState = "000000" else
    
    "000110" when presentState = "010000" else
    "010110" when presentState = "000110" else
    
    "001111" when presentState = "010110" else
    "011111" when presentState = "001111" else
    "101111" when presentState = "011111" else
    "011111" when presentState = "101111" else
    
    "100110" when presentState = "011111" else
    "010110" when presentState = "100110" else
    "000000";
    
end Behavioral;
