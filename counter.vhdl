entity counter is
Port (sClock_1Hz , reset: in STD_LOGIC;
outputState: out STD_LOGIC_vector (7 downto 0));
end counter ;
architecture Behavioral of counter is
signal presentState : STD_LOGIC_vector (3 downto 0) := “0000”;
signal nextState : STD_LOGIC_vector (3 downto 0);
begin
process (clock, reset)
begin
if reset = '1’ the
presentState <= “0001”;
elsif rising_edge(clock) then
presentState <= nextState;
end if;
end process;
outputState <= “11111” & presentState(2 downto 0);
nextState <= “0010“ when presentState = “0001“ else
“0100“ when presentState = “0010“ else
“1010“ when presentState = “0100“ else
“0001“ when presentState = “1010“ else
“0001“;
end Behavioral;
