library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Or2Way is
	port (
			y:   in  STD_LOGIC;
			x:   in  STD_LOGIC;
			q:   out STD_LOGIC);
end entity;

architecture arch of Or2Way is
begin

q <= x or y;

end architecture;
