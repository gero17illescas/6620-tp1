CFLAGS= -mno-mips16 -mgp32 -mfp32 -gpubnames  -mlong32 -mips1 -mabicalls -mlong-calls -mframe-header-opt -march=r2k 

OBJS= tp1_if_asm tp1_tables_asm

all: tp1_if tp1_tables tp1_tables_pf tp1_if_pf

prof: tp1_if_pf tp1_tables_pf

col_major:tp1_if_col_major tp1_tables_col_major

global_dims: tp1_tables_global_dims

tp1_if_pf_0: square_grid.c builders.c palette.c rules.c square_grid.c ant_engine.c ant_engine_jumps.c artist_ant.c 
	gcc -no-pie -pg -g -O0 -DSANITY_CHECK $^ -o $@

tp1_tables_pf_0: square_grid.c builders.c palette.c rules.c square_grid.c ant_engine.c ant_engine_tables.c artist_ant.c
	gcc -no-pie -pg -g -O0 -DUSE_TABLES $^ -o $@

tp1_if_pf_1: square_grid.c builders.c palette.c rules.c square_grid.c ant_engine.c ant_engine_jumps.c artist_ant.c 
	gcc -no-pie -pg -g -O1 -DSANITY_CHECK $^ -o $@

tp1_tables_pf_1: square_grid.c builders.c palette.c rules.c square_grid.c ant_engine.c ant_engine_tables.c artist_ant.c
	gcc -no-pie -pg -g -O1 -DUSE_TABLES $^ -o $@

tp1_if_pf_2: square_grid.c builders.c palette.c rules.c square_grid.c ant_engine.c ant_engine_jumps.c artist_ant.c 
	gcc -no-pie -pg -g -O2 -DSANITY_CHECK $^ -o $@

tp1_tables_pf_2: square_grid.c builders.c palette.c rules.c square_grid.c ant_engine.c ant_engine_tables.c artist_ant.c
	gcc -no-pie -pg -g -O2 -DUSE_TABLES $^ -o $@

tp1_if_pf_3: square_grid.c builders.c palette.c rules.c square_grid.c ant_engine.c ant_engine_jumps.c artist_ant.c 
	gcc -no-pie -pg -g -O3 -DSANITY_CHECK $^ -o $@

tp1_tables_pf_3: square_grid.c builders.c palette.c rules.c square_grid.c ant_engine.c ant_engine_tables.c artist_ant.c
	gcc -no-pie -pg -g -O3 -DUSE_TABLES $^ -o $@

tp1_tables_asm: square_grid.c builders.c palette.c rules.c square_grid.c ant_engine.c ant_engine_tables.S asm-helpers.c artist_ant.c 
	gcc -DUSE_GLOBAL_GRID_DIMS -g $(CFLAGS) $^ -o $@

tp1_if_asm: square_grid.c builders.c palette.c rules.c square_grid.c ant_engine.c ant_engine_jumps.S asm-helpers.c artist_ant.c 
	gcc -DUSE_GLOBAL_GRID_DIMS -g $(CFLAGS) $^ -o $@
clean:
	rm tp1_*