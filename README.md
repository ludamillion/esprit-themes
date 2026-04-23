# Esprit Themes

A collection of minimalist, accessible themes. My _Esprit Philosophy_ is that tools should be lightweight, quick, and minimally distracting. Highlightly or presenting only what information or actions are available in the present context.

## Influences

The are a few primary influences on these themes.

### Overall Approach

The greatest influence is the work of Nicolas Rougier whose design philosophy is explained in his paper "On the Design of Text Editors" which, at time of writing, can be found here https://arxiv.org/abs/2008.06030

Rougier is the author of a number of fine packages under the Nano 'brand' which follow from his design principles and push the envelope of what can be done with Emacs' interface.

Below is a summary of his principles that pertain to face definitions.

**Default**: equivalent to the Emacs face of the same name. The face for regular information.

**Critical**: for information that requires immediate action.

> It should be of high constrast when compared to other faces. It must be used scarcely.

**Popout** for information that needs attention.

> This hue must be sufficiently different from other faces so as to attract attention through the popout effect.

**Strong** for information of a structural nature.

> The same color as the default color with only the weight differs by one level.
> 
> It is generally used for titles, keywords, directory, etc.

**Salient** for information that is important.

> A different hue from the default with approximately the same intensity.
> 
> This is typically used for links.

**Faded** for information that are less important.

> The same hue as the default but with a lesser intensity.
>
> Used for comments, secondary information.

**Subtle** used to suggest a physical area on the screen.

> A very light background color that is barely perceptible. Meant to indicate a region of the II without distracting from the content of said region.
> 
> Generally used for things such as highlighting an active region.

### Color Palette

Another influence, and the source of the color palette from which I drew the colors for these themes, is Matthew Howell who does business as Reasonable Company.

Of primary interest is his Reasonable Colors project.  Reasonable Colors is a carefully considered palette of colors with simple rules for ensuring that your colors remain accessible according to the WCAG contrast specifications.

At time of this writing the Reasonable Colors palette can be found at [https://www.reasonable.work/colors](https://www.reasonable.work/colors/)

### Code 

Lastly the code itself draws heavily from John Olsson's almost-mono-themes package.  I decided not to fork his project his code is quite literally the starting point for mine.  Hence why I'm crediting him here and persisting his choice of the GPL license as well.

His themes can be found at [https://github.com/cryon/almost-mono-themes](https://github.com/cryon/almost-mono-themes)
