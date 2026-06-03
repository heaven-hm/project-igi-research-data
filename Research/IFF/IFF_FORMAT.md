# IFF Format (`.iff`)

Skeletal animation / ILFF container format for IGI 1.

**Note on Animations & Skeletons:**
All IFFs have a chunk `REIH` (bone hierarchy). The binary structure is exactly the same as in MEFs `REIH` chunk. However, `MANB` (bone names) are **not** present in IFFs. 

Because IFFs lack bone names, animation exporters must rely on hardcoded bone names based on the skeleton variation. Fortunately, in IGI 2 (and related formats) there are only two variations of skeletons:
* with 31 bones - for 3rd party animations
* with 47 bones - for 1st party animations
