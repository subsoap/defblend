# DefBlend
Blend solid colors with your sprites in Defold using various blending modes. Useful for special effects! Can be used on render targets too.

(Blending with textures is possible to add too but not in this version.)

These blending modes should generally match how they work in programs such as Photoshop. If you apply a solid color layer with clipping to a sprite you can test various effects more clickly in image editing programs.

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


Not Supported (yet?):

* Dissolve (cross fade)
* Darker Color
* Lighter Color

TODO helper functions