#Source
SV_FILE = dpi_test.sv
TOP_NAME = dpi_test
SRC = dpi_test.c
DPI_OBJ = svdpi
#Tool
MODELSIM_HOME = /home/hwang/altera/14.0/modelsim_ase/
VLIB = vlib
VLOG = vlog
VSIM = vsim
CC = gcc
#CC = clang

OBJ = $(SRC:%.c=%.o)

run : vlib vlog vsim

vlib:
	$(VLIB) work

vlog:
	$(VLOG) -sv -dpiheader dpiheader.h $(SV_FILE)

vsim: $(DPI_OBJ).so
	$(VSIM) -c -sv_lib $(DPI_OBJ) $(TOP_NAME)  -do "run -all; quit -f"

.c.o:
	$(CC) -c -fpic -m32 -I$(MODELSIM_HOME)/include $<

$(DPI_OBJ).so :$(OBJ)
	$(CC) -shared -m32 $(OBJ) -o $(DPI_OBJ).so

clean:
	rm -rf work dpi.so $(DPI_OBJ).so $(OBJ)  transcript *.wlf dpiheader.h
