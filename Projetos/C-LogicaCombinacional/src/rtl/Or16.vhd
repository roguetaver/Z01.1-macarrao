library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Or3Way is
	port (
			y:   in  STD_LOGIC;
			x:   in  STD_LOGIC;
			z:   in  STD_LOGIC;
			q:   out STD_LOGIC);
end entity;

architecture arch of Or3Way is
begin

q <= x or y or z;

end architecture;
