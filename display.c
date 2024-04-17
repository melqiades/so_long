#include <mlx.h>


// int	main(void)
// {
// 	void	*mlx;
// 	void	*mlx_win;

// 	mlx = mlx_init(); // location of current MLX instance
// 	mlx_win = mlx_new_window(mlx, 1920, 1080, "Hello window!"); // pointer to the created windows
// 	mlx_loop(mlx); // rendering of the window
// }

// int	main(void)
// {
// 	void	*img;
// 	void	*mlx;

// 	mlx = mlx_init();
// 	img = mlx_new_image(mlx, 1920, 1080);
// }

typedef	struct s_data
{
	void	*img;
	char	*addr;
	int		bits_per_pixel;
	int		line_length;
	int		endian;
}	t_data;

void	my_mlx_pixel_put(t_data *data, int x, int y, int color)
{
	char	*dst;

	dst = data->addr + (y * data->line_length + x * (data->bits_per_pixel / 8));
	*(unsigned int*)dst = color;
}

int	main(void)
{
	void	*mlx;
	void	*mlx_win;
	t_data	img;
	int	x = 0, y = 0;

	mlx = mlx_init();
	mlx_win = mlx_new_window(mlx, 1000, 800, "Hey you!");
	img.img = mlx_new_image(mlx, 100, 800);

	img.addr = mlx_get_data_addr(img.img, &img.bits_per_pixel, &img.line_length, &img.endian);
	while (x<20)
	{
		my_mlx_pixel_put(&img, x, y, 0xFFFFFF00);
		x++,y++;
	}

	mlx_put_image_to_window(mlx, mlx_win, img.img, 0, 0);
	mlx_loop(mlx);
}
