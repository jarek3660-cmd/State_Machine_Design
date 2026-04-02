----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2026 09:35:29 PM
-- Design Name: 
-- Module Name: Gray_Code_Display - Behavioral
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

entity Gray_Code_Display is
    Port ( System_Clock_Loc : in STD_LOGIC;
           Count_Loc : out STD_LOGIC_VECTOR (1 downto 0);
           Reset_Loc : in STD_LOGIC);
end Gray_Code_Display;

architecture Behavioral of Gray_Code_Display is

component Frequency_Divider is
    Port ( Clock_System : in STD_LOGIC;
           Clock_1Hz : out STD_LOGIC);
end component;

component Gray_Code_Counter is
    Port ( Clock_System : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Count : out STD_LOGIC_VECTOR (1 downto 0));
end component;

signal slow_Clock : STD_LOGIC;
begin

fd1: Frequency_Divider Port map (Clock_System => System_Clock_Loc,
                       Clock_1Hz => slow_Clock);
counter_Inst: Gray_Code_Counter Port map(Clock_System => slow_Clock,
                                         Reset => Reset_Loc,
                                         Count => Count_Loc);


end Behavioral;
