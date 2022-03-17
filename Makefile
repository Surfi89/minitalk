# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ajordan- <ajordan-@student.42urduliz.com>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/19 15:23:08 by ajordan-          #+#    #+#              #
#    Updated: 2022/02/20 13:24:50 by ajordan-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SHELL		=	/bin/bash

NAME		= client
NAMESV		= server
NAMEBC		= client_bonus
NAMEBS		= server_bonus
LIBFT		= libft
INC		= inc
HEADER		= -I inc
SRC_DIR		= src/
OBJ_DIR		= obj/
CC		= gcc
FLAGS		= -Wall -Werror -Wextra
FSANITIZE	= -fsanitize=address -g3
RM		= rm -f
ECHO		= echo -e

DEF_COLOR	=	\033[0;39m
ORANGE		=	\033[0;33m
GRAY		=	\033[0;90m
RED		=	\033[0;91m
GREEN		=	\033[1;92m
YELLOW		=	\033[1;93m
BLUE		=	\033[0;94m
MAGENTA		=	\033[0;95m
CYAN		=	\033[0;96m
WHITE		=	\033[0;97m

SRCCL_FILES	=	client
SRCSV_FILES	=	server
SRCBC_FILES	=	client_bonus
SRCBS_FILES	=	server_bonus

SRCCL 		= 	$(addprefix $(SRC_DIR), $(addsuffix .c, $(SRCCL_FILES)))
OBJCL 		= 	$(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRCCL_FILES)))

SRCSV 		= 	$(addprefix $(SRC_DIR), $(addsuffix .c, $(SRCSV_FILES)))
OBJSV 		= 	$(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRCSV_FILES)))

SRCBC 		= 	$(addprefix $(SRC_DIR), $(addsuffix .c, $(SRCBC_FILES)))
OBJBC 		= 	$(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRCBC_FILES)))

SRCBS 		= 	$(addprefix $(SRC_DIR), $(addsuffix .c, $(SRCBS_FILES)))
OBJBS 		= 	$(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRCBS_FILES)))



OBJF		=	.cache_exists

start:
			@make -C $(LIBFT)
			@cp $(LIBFT)/libft.a .
			@$(ECHO) -n "$(YELLOW)[Dependencies]:\t$(DEF_COLOR)"
			@$(ECHO) -n "$(RED)[$(DEF_COLOR)"
			@make all

all:		$(NAME) $(NAMESV)

$(NAME):	$(OBJCL) $(OBJF)
			@$(CC) $(FLAGS) $(OBJCL) $(HEADER) libft.a -o $(NAME)

$(NAMESV):	$(OBJSV) $(OBJF)
			@$(ECHO) -n "$(RED)]$(DEF_COLOR)"
			@$(ECHO) -n "$(GREEN) => 100%$(DEF_COLOR)\n"
			@$(ECHO) -n "$(YELLOW)[minitalk]:\t$(DEF_COLOR)"
			@$(CC) $(FLAGS) $(OBJSV) $(HEADER) libft.a -o $(NAMESV)
			@$(ECHO) "$(GREEN) => Success!$(DEF_COLOR)"

$(OBJ_DIR)%.o: $(SRC_DIR)%.c $(OBJF)
			@$(ECHO) -n "$(ORANGE)=$(DEF_COLOR)"
			@$(CC) $(FLAGS) $(HEADER) -c $< -o $@

$(OBJF):
			@mkdir -p $(OBJ_DIR)
			@touch $(OBJF)

bonus:
			@make -C $(LIBFT)
			@cp $(LIBFT)/libft.a .
			@$(ECHO) -n "$(YELLOW)[Dependencies]:\t$(DEF_COLOR)"
			@$(ECHO) -n "$(RED)[$(DEF_COLOR)"
			@make allbonus

allbonus:		$(NAMEBC) $(NAMEBS)

$(NAMEBC):	$(OBJBC) $(OBJF)
			@$(CC) $(FLAGS) $(OBJBC) $(HEADER) libft.a -o $(NAMEBC)

$(NAMEBS):	$(OBJBS) $(OBJF)
			@$(ECHO) -n "$(RED)]$(DEF_COLOR)"
			@$(ECHO) -n "$(GREEN) => 100%$(DEF_COLOR)\n"
			@$(ECHO) -n "$(YELLOW)[minitalk_bonus]:\t$(DEF_COLOR)"
			@$(CC) $(FLAGS) $(OBJBS) $(HEADER) libft.a -o $(NAMEBS)
			@$(ECHO) "$(GREEN) => Success!$(DEF_COLOR)"

clean:
			@$(RM) -r $(OBJ_DIR)
			@$(RM) $(OBJF)
			@make clean -C $(LIBFT)
			@$(ECHO) -n "$(BLUE)[minitalk]:\tobject files$(DEF_COLOR)$(GREEN)  => Cleaned!$(DEF_COLOR)\n"

fclean:		clean
			@$(RM) $(NAME) $(NAMESV) $(NAMEBC) $(NAMEBS)
			@$(RM) $(LIBFT)/libft.a
			@$(RM) libft.a
			@find . -name ".DS_Store" -delete
			@$(ECHO) -n "$(CYAN)[LIBFT]:\texec. files$(DEF_COLOR)$(GREEN)  => Cleaned!$(DEF_COLOR)\n"
			@$(ECHO) -n "$(CYAN)[minitalk]:\texec. files$(DEF_COLOR)$(GREEN)  => Cleaned!$(DEF_COLOR)\n"


re:			fclean all
			@$(ECHO) -n "$(GREEN)Cleaned and rebuilt everything for [minitalk]!$(DEF_COLOR)\n"

norm:
			@clear
			@norminette $(SRC) $(INC) $(LIBFT) | grep -v Norme -B1 || true

.PHONY:		start all clean fclean re bonus norm

