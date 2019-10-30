library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity And16 is
	port ( 
			x:   in  STD_LOGIC_vector(15 downto 0);
			y:   in  STD_LOGIC_vector(15 downto 0);
			q:   out STD_LOGIC_vector(15 downto 0));
end entity;

architecture arch of And16 is
begin

q <= x and y;


end architecture;
