# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ajordan- <ajordan-@student.42urduliz.com>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/19 15:23:08 by ajordan-          #+#    #+#              #
#    Updated: 2022/02/19 20:09:30 by ajordan-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SHELL		=	/bin/bash

NAME		= client
NAMESV		= server
NAMEBC		= client_bonus
NAMEBS		= server_bonus
INC		= inc
HEADER		= -I inc
SRC_DIR		= src/
OBJ_DIR		= obj/
CC		= gcc
CFLAGS		= -Wall -Werror -Wextra
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
COMM_FILES	=	utils
SRCBC_FILES	=	client_bonus
SRCBS_FILES	=	server_bonus

SRCCL 		= 	$(addprefix $(SRC_DIR), $(addsuffix .c, $(SRCCL_FILES)))
OBJCL 		= 	$(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRCCL_FILES)))

SRCSV 		= 	$(addprefix $(SRC_DIR), $(addsuffix .c, $(SRCSV_FILES)))
OBJSV 		= 	$(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRCSV_FILES)))

COMM_SRC	= 	$(addprefix $(SRC_DIR), $(addsuffix .c, $(COMM_FILES)))
COMM_OBJ 	= 	$(addprefix $(OBJ_DIR), $(addsuffix .o, $(COMM_FILES)))

SRCBC 		= 	$(addprefix $(SRC_DIR), $(addsuffix .c, $(SRCBC_FILES)))
OBJBC 		= 	$(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRCBC_FILES)))

SRCBS 		= 	$(addprefix $(SRC_DIR), $(addsuffix .c, $(SRCBS_FILES)))
OBJBS 		= 	$(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRCBS_FILES)))



OBJF		=	.cache_exists

start:
			@$(ECHO) -n "$(YELLOW)[Dependencies]:\t$(DEF_COLOR)"
			@$(ECHO) -n "$(RED)[$(DEF_COLOR)"
			@make all

all:		$(NAME) $(NAMESV)

$(NAME):	$(OBJCL) $(COMM_OBJ) $(OBJF)
			@$(CC) $(CFLAGS) $(OBJCL) $(COMM_OBJ) $(HEADER) -o $(NAME)

$(NAMESV):	$(OBJSV) $(COMM_OBJ) $(OBJF)
			@$(ECHO) -n "$(RED)]$(DEF_COLOR)"
			@$(ECHO) -n "$(GREEN) => 100%$(DEF_COLOR)\n"
			@$(ECHO) -n "$(YELLOW)[minitalk]:\t$(DEF_COLOR)"
			@$(CC) $(CFLAGS) $(OBJSV) $(COMM_OBJ) $(HEADER) -o $(NAMESV)
			@$(ECHO) "$(GREEN) => Success!$(DEF_COLOR)"

$(OBJ_DIR)%.o: $(SRC_DIR)%.c $(OBJF)
			@$(ECHO) -n "$(ORANGE)=$(DEF_COLOR)"
			@$(CC) $(CFLAGS) $(HEADER) -c $< -o $@

$(OBJF):
			@mkdir -p $(OBJ_DIR)
			@touch $(OBJF)

bonus:
			@$(ECHO) -n "$(YELLOW)[Dependencies]:\t$(DEF_COLOR)"
			@$(ECHO) -n "$(RED)[$(DEF_COLOR)"
			@make allbonus

allbonus:		$(NAMEBC) $(NAMEBS)

$(NAMEBC):	$(OBJBC) $(COMM_OBJ) $(OBJF)
			@$(CC) $(CFLAGS) $(OBJBC) $(COMM_OBJ) $(HEADER) -o $(NAMEBC)

$(NAMEBS):	$(OBJBS) $(COMM_OBJ) $(OBJF)
			@$(ECHO) -n "$(RED)]$(DEF_COLOR)"
			@$(ECHO) -n "$(GREEN) => 100%$(DEF_COLOR)\n"
			@$(ECHO) -n "$(YELLOW)[minitalk_bonus]:\t$(DEF_COLOR)"
			@$(CC) $(CFLAGS) $(OBJBS) $(COMM_OBJ) $(HEADER) -o $(NAMEBS)
			@$(ECHO) "$(GREEN) => Success!$(DEF_COLOR)"

clean:
			@$(RM) -r $(OBJ_DIR)
			@$(RM) $(OBJF)
			@$(ECHO) -n "$(BLUE)[minitalk]:\tobject files$(DEF_COLOR)$(GREEN)  => Cleaned!$(DEF_COLOR)\n"

fclean:		clean
			@$(RM) $(NAME)
			@$(RM) $(NAMESV)
			@$(RM) $(NAMEBC)
			@$(RM) $(NAMEBS)
			@find . -name ".DS_Store" -delete
			@$(ECHO) -n "$(CYAN)[minitalk]:\texec. files$(DEF_COLOR)$(GREEN)  => Cleaned!$(DEF_COLOR)\n"


re:			fclean all
			@$(ECHO) -n "$(GREEN)Cleaned and rebuilt everything for [minitalk]!$(DEF_COLOR)\n"

norm:
			@clear
			@norminette $(SRC) $(INC) $(LIBFT) | grep -v Norme -B1 || true

.PHONY:		start all clean fclean re bonus norm

