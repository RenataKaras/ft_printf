# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: rkaras <rkaras@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2023/12/04 16:23:38 by rkaras        #+#    #+#                  #
#    Updated: 2023/12/05 16:36:28 by rkaras        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
LIBFT = Libft/libft.a
LIBFTDIR = Libft
CC = cc
CFLAGS = -Wall -Werror -Wextra
RM = rm -f
AR = ar -rsc

SOURCE = ft_inthex.c \
			ft_itoa_printf.c \
			ft_pointhex.c \
			ft_printf.c \
			ft_putchar_printf.c \
			ft_putnbr_printf.c \
			ft_putstr_printf.c \

OBJECTS = $(SOURCE:%.c=%.o)

all: $(NAME)

$(LIBFT):
		$(MAKE) -C $(LIBFTDIR)

$(NAME): $(LIBFT) $(OBJECTS)
		cp $(LIBFT) $(NAME)
		$(AR) $(NAME) $(OBJECTS) $(LIBFT)

%.o:%.c
	$(CC) $(CFLAGS) -c -o $@ $^ -I $(LIBFTDIR)

clean:
	$(MAKE) clean -C $(LIBFTDIR)
	$(RM) $(OBJECTS)

fclean:	clean
	$(MAKE) fclean -C $(LIBFTDIR)
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re