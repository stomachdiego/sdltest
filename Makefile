
NAME = sdltest
N_SDLARCH = SDL2-2.0.10.tar.gz


D_SRC = ./src/
D_INC = ./includes/

D_SDL = ./SDL2-2.0.10/
D_SDLINC = $(D_SDL)include
D_SDLLIB = $(D_SDL)lib
D_OBJ = ./obj/
D_INCL = ./SDL2-2.0.10/lib/libSDL2.a
L_SDL = `$(D_SDL)sdl2-config --cflags --libs`
MLX_FLAGS = -l./SDL2-2.0.10/lib/libSDL2.a

C_FILES =		main.c


SRC = $(addprefix $(D_SRC), $(C_FILES))
OBJ = $(addprefix $(D_OBJ), $(C_FILES:.c=.o))

CC = gcc
CFLAGS = -O3
INC = -I $(D_INC)  -I $(D_SDLINC)

C_RED = \033[31m
C_GREEN = \033[32m
C_CYAN = \033[36m
C_NONE = \033[0m

all: $(NAME)

$(NAME): $(D_SDL) $(D_SDLLIB) $(D_OBJ) $(OBJ)
	@$(CC) $(OBJ) $(L_SDL) -o $(NAME) 
	@printf "SDLtest:  %-25s$(C_GREEN)[done]$(C_NONE)\n" $@

$(D_SDL):
	@tar -xf $(N_SDLARCH)
	@printf "SDLtest:  %-25s$(C_CYAN)[extracted]$(C_NONE)\n" $@

$(D_SDLLIB):
	@mkdir $(D_SDLLIB)
	@printf "\n$(C_CYAN)[configuring SDL]$(C_NONE)\n"
	@cd $(D_SDL); ./configure --prefix=`pwd`/lib
	@printf "$(C_CYAN)[compiling SDL]$(C_NONE)\n"
	@make -C $(D_SDL)
	@make -C $(D_SDL) install >/dev/null
	@printf "SDLtest:  %-25s$(C_GREEN)[done]$(C_NONE)\n" $@

$(D_OBJ):
	@mkdir $(D_OBJ)
	@printf "SDLtest:  %-25s$(C_GREEN)[done]$(C_NONE)\n" $@

$(D_OBJ)%.o: $(D_SRC)%.c $(HEADER_FILES)
	@$(CC) $(CFLAGS) -c $(INC) $< -o $@
	@printf "SDLtest:  %-25s$(C_GREEN)[done]$(C_NONE)\n" $@

clean:
	@rm -rf $(D_OBJ)
	@printf "SDLtest:  %-25s$(C_RED)[done]$(C_NONE)\n" $@

fclean: clean
	@rm -rf $(NAME)
	@rm -rf $(D_SDL)
	@printf "SDLtest:  %-25s$(C_RED)[done]$(C_NONE)\n" $@

re: fclean all