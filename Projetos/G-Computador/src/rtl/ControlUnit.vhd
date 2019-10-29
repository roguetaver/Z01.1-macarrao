-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: ControlUnit.vhd
-- date: 4/4/2017

-- Unidade que controla os componentes da CPU

library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
    port(
		instruction                 : in STD_LOGIC_VECTOR(17 downto 0);  -- instrução para executar
		zr,ng                       : in STD_LOGIC := '0';                      -- valores zr(se zero) e ng(se negativo) da ALU
		muxALUI_A                   : out STD_LOGIC;                     -- mux que seleciona entre instrução e ALU para reg. A
		muxAM                       : out STD_LOGIC;                     -- mux que seleciona entre reg. A e Mem. RAM para ALU
		muxSD_ALU                   : out STD_LOGIC;                     -- mux que seleciona entre reg. S e reg. D
	   muxAMD_ALU                  : out STD_LOGIC;                     -- mux que seleciona entre reg. A e Mem. RAM para ALU
		zx, nx, zy, ny, f, no       : out STD_LOGIC;                     -- sinais de controle da ALU
	   loadA, loadD, loadS, loadM, loadPC : out STD_LOGIC               -- sinais de load do reg. A, reg. D,
         	                                                           -- Mem. RAM e Program Counter
    );
end entity;

architecture arch of ControlUnit is

	signal r0,r1,r2, i17, j0, j1, j2, sno: std_logic;


begin

r0<=instruction(13);
r1<=instruction(14);
r2<=instruction(15);
i17<= instruction(17);
j0 <= instruction(0);
j1 <= instruction(1);
j2 <= instruction(2);


zx <= i17 and instruction(12);
nx <= i17 and instruction(11);
zy <= i17 and instruction(10);
ny <= i17 and instruction(9);
f  <= i17 and instruction(8);
sno  <= i17 and instruction(7);


muxALUI_A <=  not i17;
muxAM <= i17 and ((r2 or r1 or r0)and(r2 or r1 or not r0));
muxAMD_ALU <= i17 and (not r2 or r1 or not r0);
muxSD_ALU <= i17 and ((not r2 and not r1 and not sno) or (not r2 and r1 and not r0));

loadA <= not i17 or (i17 and instruction(6));
loadD <= i17 and instruction(4);
loadS <= i17 and instruction(5);
loadM <= i17 and instruction(3);
loadPC <= i17 and ((not j2 and not j1 and j0 and not ng and not zr) or 
					(not j2 and  j1  and  not j0  and zr) or
					(not j2 and j1 and j0 and not ng ) or
					(j2 and not j1 and not j0 and ng) or
					(j2 and not j1 and j0 and not zr) or
					(j2 and j1 and not j0 and ng and zr) or
(j2 and j1 and j0 ));


no <= sno;



end architecture;
