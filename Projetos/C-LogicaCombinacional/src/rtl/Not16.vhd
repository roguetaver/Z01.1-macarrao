library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Not1 is
	port ( 
			x:   in  STD_LOGIC;
			q:   out STD_LOGIC);
end entity;

architecture arch of Not1 is

begin

q <= not x;

end architecture;
