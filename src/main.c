/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sdiego <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/15 14:01:55 by sdiego            #+#    #+#             */
/*   Updated: 2020/01/15 14:01:57 by sdiego           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <SDL.h>
# define WIDTH 640
# define HEIGHT 480

const int SCREEN_WIDTH = 640;
const int SCREEN_HEIGHT = 480;

int main (int argc, char ** args) 
{
    
    if( SDL_Init( SDL_INIT_EVERYTHING ) != 0 )
    {
        return 1;
    }
    SDL_Surface* screen_surface = NULL;

    SDL_Window* window = NULL;

	SDL_Renderer* renderer;


    window = SDL_CreateWindow("Hello, SDL 2!", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 640, 480, SDL_WINDOW_SHOWN);
    
    if (window == NULL) {
        return 1;
    }
	
    screen_surface = SDL_GetWindowSurface(window);

    SDL_FillRect(screen_surface, NULL, SDL_MapRGB( screen_surface->format, 0xFF, 0xFF, 0xFF));

    SDL_UpdateWindowSurface(window);

   // SDL_Delay(2000);

	SDL_Event e;
	int quit = 0;
	while (quit == 0)
	{
		while (SDL_PollEvent(&e))
		{
			if (e.type == SDL_QUIT)
				quit = 1;
			/*if (e.type == SDL_KEYDOWN)
				quit = 1;
			if (e.type == SDL_MOUSEBUTTONDOWN)
				quit = 1;*/
		}
	}
	
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}