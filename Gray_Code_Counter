----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2026 02:29:48 PM
-- Design Name: 
-- Module Name: Gray_Code_Counter - Behavioral
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

entity Gray_Code_Counter is
    Port ( Clock_System : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Count : out STD_LOGIC_VECTOR (1 downto 0));
end Gray_Code_Counter;

architecture Behavioral of Gray_Code_Counter is

signal presentState: STD_LOGIC_VECTOR (1 downto 0) := "00";
signal nextState : STD_LOGIC_VECTOR (1 downto 0);

begin

process(Clock_System, Reset)
begin
    if reset = '1' then
        presentState <= "00";
    elsif rising_edge(Clock_System) then
        presentState <= nextState;
    end if;
end process;

Count <= presentState;

nextState <= "01" when presentState = "00" else
             "10" when presentState = "01" else
             "11" when presentState = "10" else
"00";
        
end Behavioral;
