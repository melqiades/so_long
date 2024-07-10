# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lpesan <lpesan@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/10 18:11:51 by lpesan            #+#    #+#              #
#    Updated: 2024/07/10 20:28:55 by lpesan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= so_long
LIBMLX	= ./MLX42
LIBFT	= ./libft

HEADERS	= -I ./include -I ${LIBMLX}/include -I ${LIBFT}
LIBS	= $(LIBMLX)/build/libmlx42.a -ldl -lglfw -pthread -lm ${LIBFT}/libft.a

SRCS	= $(shell find ./src -iname "*.c")

OBJS	= ${SRCS:.c=.o}

all: libft libmlx ${NAME}

libft:
	@${MAKE} -C ${LIBFT}

libmlx:
	@cmake $(LIBMLX) -DDEBUG=1 -B $(LIBMLX)/build && make -C $(LIBMLX)/build -j4

%.o: %.c
	@${CC} ${CFLAGS} -o $@ -c $< ${HEADERS} && printf "Compiling: $(notdir $<)\n"

${NAME}: ${OBJS}
	@${CC} ${OBJS} ${LIBS} ${HEADERS} -o ${NAME}

clean:
	@rm -f ${OBJS}
	@${MAKE} -C ${LIBFT} clean

fclean: clean
	@rm -f ${NAME}
	@${MAKE} -C ${LIBFT} fclean
	
re: clean all

.PHONY: all, clean, fclean, re, libmlx, libft