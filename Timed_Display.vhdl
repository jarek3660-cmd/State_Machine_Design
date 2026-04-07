----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2026 02:18:00 PM
-- Design Name: 
-- Module Name: Timed_Display - Behavioral
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

entity Timed_Display is
    Port ( Clk_Loc, Res_Loc : in STD_LOGIC;
           C_7SD_Loc, A_7SD_Loc : out STD_LOGIC_VECTOR (7 downto 0));
end Timed_Display;

architecture Behavioral of Timed_Display is

component Timed_Platform is
    Port ( Clk_System_Loc, Reset_Loc : in STD_LOGIC;
           Cathode_7SD_Loc, Anode_7SD_Loc : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Frequency_Divider is
    Port ( Clock_System : in STD_LOGIC;
           Clock_1Hz : out STD_LOGIC);
end component;

signal slowClock : STD_LOGIC;
begin

fd: Frequency_Divider Port map(Clock_System => Clk_Loc,
                               Clock_1Hz => slowClock);
Timed_dis: Timed_Platform Port map(Clk_System_Loc => slowClock,
                                    Reset_Loc => Res_Loc,
                                    Cathode_7SD_loc => C_7SD_Loc,
                                    Anode_7SD_Loc => A_7SD_Loc);


end Behavioral;
