
NAME		= prog

RM			= rm -f

CC			= gcc

CFLAGS		= #-Wall -Wextra -Werror

SRCS = $(wildcard *.c)   # Finds all .c files in the directory

OBJS = $(SRCS:.c=.o)    # Replaces .c with .o for object filenames

all:		${NAME}

%.o: %.c
	$(CC) $(CFLAGS) -I/usr/include -Imlx_linux -O3 -c $< -o $@

$(NAME): $(OBJS)
	$(CC) $(OBJS) -Lmlx_linux -lmlx_Linux -L/usr/lib -Imlx_linux -lXext -lX11 -lm -lz -o $(NAME)

clean:
			rm -f ${OBJS}

fclean:		clean
			rm -f ${NAME}

re:			fclean all

.PHONY:		all clean fclean re
