----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2026 03:32:53 PM
-- Design Name: 
-- Module Name: Robot_Eye_Counter_tb - Behavioral
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

entity Robot_Eye_Counter_tb is
--  Port ( );
end Robot_Eye_Counter_tb;

architecture Behavioral of Robot_Eye_Counter_tb is

component Robot_Eye_Counter is
    Port (Clock_System , Reset: in STD_LOGIC;
          Cathode_7SD, Anode_7SD: out STD_LOGIC_vector (7 downto 0));
end component;

signal Clk_Sys, Res : STD_LOGIC;
signal C_7SD, A_7SD : STD_LOGIC_VECTOR(7 downto 0);
constant Clock_100Mhz_Period : time := 10ns;
begin

robocounter: Robot_Eye_Counter Port map(Clock_System => Clk_Sys,
                                        Reset => Res,
                                        Cathode_7SD => C_7SD,
                                        Anode_7SD => A_7SD);
Clk_process: process
    begin
        Clk_Sys <= '0'; wait for Clock_100Mhz_Period/2;
        Clk_Sys <= '1'; wait for Clock_100Mhz_Period/2;
    end process;
    
    stim_process: process
        begin
            Res <= '1';
        wait for 50ns;
            Res <= '0';
        wait for 50ns;
     end process;
end Behavioral;
