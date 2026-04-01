----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2026 12:59:42 PM
-- Design Name: 
-- Module Name: Gray_Code_tb - Behavioral
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

entity Gray_Code_tb is
--  Port ( );
end Gray_Code_tb;

architecture Behavioral of Gray_Code_tb is

component Gray_Code_Counter is
    Port ( Clock_System : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Count : out STD_LOGIC_VECTOR (1 downto 0));
end component;

signal Clk_Sys_Loc, Reset_Loc: STD_LOGIC;
signal Count_Loc :  STD_LOGIC_VECTOR (1 downto 0);

constant Clock_100Mhz_Period : time := 10ns;



begin

    uut: Gray_Code_Counter Port map(
       Clock_System => Clk_Sys_Loc,
        Reset => Reset_Loc,
        Count => Count_loc);
    
    Clk_process : process
    begin
        Clk_Sys_Loc <= '0'; wait for Clock_100Mhz_Period/2;
        Clk_Sys_Loc <= '1'; wait for Clock_100Mhz_Period/2;
    end process;
    
    stim_process : process
    begin
        Reset_Loc <= '1';
        wait for 50ns;
        Reset_Loc <= '0';
        wait for 50ns;
     end process;
     
end Behavioral;
