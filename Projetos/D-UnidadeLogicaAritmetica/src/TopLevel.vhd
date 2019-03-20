----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
	port(
		SW      : in  std_logic_vector(9 downto 0);
		LEDR    : out std_logic_vector(9 downto 0)
	);
end entity;

----------------------------
-- Implementacao do bloco -- 
----------------------------
architecture rtl of TopLevel is

--------------
-- signals
--------------

  signal x : std_logic_vector(15 downto 0) := x"0001"; -- 1
  signal y : std_logic_vector(15 downto 0) := x"0002"; -- 2

--------------=
-- component
--------------

  COMPONENT ALU
    PORT
      (
        x		:	 IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        y		:	 IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        zx	    :	 IN STD_LOGIC;
        nx	    :	 IN STD_LOGIC;
        zy	    :	 IN STD_LOGIC;
        ny	    :	 IN STD_LOGIC;
        f		:	 IN STD_LOGIC;
        no	    :	 IN STD_LOGIC;
        zr	    :	 OUT STD_LOGIC;
        ng	    :	 OUT STD_LOGIC;
		  sl      : IN STD_LOGIC;
        saida	:	 OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
  END COMPONENT;

---------------
-- implementacao
---------------
begin

  ula0: ALU port map (
    x                  => x,
    Y                  => y,
    Zx                 => SW(0),
    Nx                 => SW(1),
    Zy                 => SW(2),
    Ny                 => SW(3),
    F                  => SW(4),
    No                 => SW(5),
	 Sl                 => SW(6),
    Zr                 => LEDR(8),
    Ng                 => LEDR(9),
    Saida(7 downto 0)  => LEDR(7 downto 0),
    Saida(15 downto 8) => Open
   );


end rtl;
