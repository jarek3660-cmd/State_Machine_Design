----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2026 10:00:34 PM
-- Design Name: 
-- Module Name: Robot_Eye_Counter - Behavioral
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

entity Robot_Eye_Counter is
    Port (Clock_System , Reset: in STD_LOGIC;
          Cathode_7SD, Anode_7SD: out STD_LOGIC_vector (7 downto 0));
end Robot_Eye_Counter;



architecture Behavioral of Robot_Eye_Counter is

signal presentState : STD_LOGIC_VECTOR (4 downto 0) := "00000";
signal nextState : STD_LOGIC_vector (4 downto 0);

begin

    process (Clock_System, Reset)
    begin
        if Reset = '1' then
        presentState <= "00001";
        elsif rising_edge(Clock_System) then
        presentState <= nextState;
        end if;
    end process;

Cathode_7SD <= "00000011";
Anode_7SD <= "1111" & presentState(3 downto 0);
nextState <= "11110" when presentState = "00001" else
"11101" when presentState = "00010" else
"11011" when presentState = "00100" else
"10111" when presentState = "01000" else
"11011" when presentState = "10010" else
"11101" when presentState = "10100" else
"11110";

end Behavioral;
