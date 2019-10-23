library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity And1 is
	port ( 
			x:   in  STD_LOGIC;
			y:   in  STD_LOGIC;
			q:   out STD_LOGIC);
end entity;

architecture arch of And1 is
begin

q <= x and y;


end architecture;
