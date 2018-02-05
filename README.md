# DefBlend
Blend solid colors with your sprites in Defold using various blending modes. Useful for special effects! Can be used on render targets too.

(Blending with textures is possible to add too but not in this version.)

## Installation
You can use DefBlend in your own project by adding this project as a [Defold library dependency](http://www.defold.com/manuals/libraries/). Open your game.project file and in the dependencies field under project add:

	https://github.com/subsoap/defblend/archive/master.zip

You can also manually add shader materials individually to your project.

## Usage

Add a blending material to your sprite either normal or pixel version. Then in a script change the color and alpha of that blending mode. You could create new materials with a mixture of different blending methods if you want multiple effects.
	
These blending modes should generally match how they work in programs such as Photoshop. If you apply a solid color layer with clipping to a sprite you can test various effects more quickly in image editing programs.

Setting custom properties to materials breaks batching of rendering. If you want a little more performance and always use the same values for an effect you can make a copy of a blend material, set the properties within it to whatever values you need. Then use that version of the material instead of changing the stock DefBlend materials with setting their properties for each.

Blending Modes:

* Normal
---
* Darken
* Multiply
* Color Burn
* Linear Burn
---
* Lighten
* Screen
* Color Dodge
* Linear Dodge (Add)
---
* Overlay
* Soft Light
* Hard Light
* Vivid Light
* Linear Light
* Pin Light
* Hard Mix
---
* Difference
* Exclusion
* Subtract
* Divide
---
* Average
* Glow
* Negation
* Phoenix
* Reflect

Not Supported (yet?):

* Dissolve (cross fade)
* Darker Color
* Lighter Color
* Hue
* Saturation
* Color
* Luminosity

TODO helper functions