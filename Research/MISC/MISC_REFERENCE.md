# MISC - Complete Reference

Consolidated documentation for MISC file format.

---

## Cameraengine

This is a **high-level overview** of how the camera works in Project I.G.I and in game engines generally — short, clear, and practical.

---

# 🧠 1️⃣ What Is a Camera in a Game Engine?

A camera in a 3D engine is:

> A mathematical transform that defines how the world is viewed.

It consists of:

- 📍 **Position** (X, Y, Z)
- 🔄 **Rotation** (orientation in space)
- 📐 **Projection settings** (FOV, near/far plane)

The camera does not move the world.

Instead:

```
World is transformed relative to camera.
```

---

# 🎥 2️⃣ Basic Camera Concepts

## 📍 Position

Defines where the camera exists in 3D space:

```
X → Left / Right
Y → Forward / Backward
Z → Up / Down
```

---

## 🔄 Rotation

Defined by three angles:

### 🧭 Yaw
- Turn left / right
- Rotation around vertical axis

### 🔼 Pitch
- Look up / down
- Rotation around side axis

### 🔁 Roll
- Tilt sideways
- Rarely used in FPS games

In IGI:

- Yaw + Pitch are active
- Roll is typically unused

---

# 🧮 3️⃣ Rotation Matrix (Why 9 Floats?)

Instead of storing yaw/pitch directly,
IGI converts them into a **3×3 rotation matrix**.

Conceptually:

```c
float rotation[9]; // 3x3 orientation matrix
```

Why?

- Faster rendering math
- Stable 3D transformations
- Direct use in view matrix calculations

---

# 🏗 4️⃣ Structure of IGI Camera (Simplified)

Internally it looks similar to:

```c
typedef struct IGICamera
{
    float rotation[9];   // Orientation
    float position[3];   // X, Y, Z
    float stateData[...];
} IGICamera;
```

Then copied into a viewport structure used by the renderer.

---

# 🖥 5️⃣ What Is the Viewport?

The viewport is:

> The final camera buffer used by the renderer.

It contains:

- Rotation (floats)
- Position (often doubles for precision)
- Rendering-related values

Renderer reads this every frame.

---

# 🔁 6️⃣ IGI Camera Flow (Simplified)

Each frame:

```
Mouse Input
     ↓
Update Yaw & Pitch
     ↓
Build Rotation Matrix
     ↓
Update Position
     ↓
Copy Camera → Viewport
     ↓
Render Scene
```

---

# 🎬 7️⃣ Use Cases of IGI Camera System

IGI uses the same base system for:

- 🎯 First-person gameplay
- 👤 Third-person mode
- 🎥 Mission scripted cameras
- 🎬 Cutscenes
- 🛰 Debug camera modes

The difference is only how:

- Position is updated
- Rotation is controlled
- Camera state flags are set

---

# 🧩 Core Takeaway

IGI Camera =

- Position in 3D space
- Orientation (Yaw + Pitch → Rotation Matrix)
- Copied into viewport
- Used by renderer

Everything visual in the game depends on this transform.

That’s the entire foundation of the IGI camera engine. 🚀

---

## Sfx Table

| Name       | Children                                                                                                                        |
|------------|---------------------------------------------------------------------------------------------------------------------------------|
| Ambiance   | m1_ambience, m13_ambience, m14_ambience, m11_ambience, m2_ambience, m3_ambience, m4_ambience, m5_ambience, m6_ambience, m7_ambience, m8_ambience, m9_ambience |
| Animal     | bird_01, bird_02, bird_03, dog_01, dog_01_cut, dog_02, dog_02_cut                                                                  |
| Car        | car_01, car_1                                                                                                                   |
| Clothing   | bul_textile_1                                                                                                                   |
| Concrete   | bul_concrete_1, bul_concrete_2                                                                                                   |
| Dirt       | bul_dirt_1, bul_dirt_2                                                                                                           |
| Door       | door_close_1, door_move_1, door_open_1, door_slide_1                                                                              |
| Electricity | electricity_2                                                                                                                   |
| Flesh      | bul_flesh_1, bul_flesh_2, bul_flesh_3, bul_flesh_4, bul_flesh_5                                                                   |
| Glass      | bul_glass_1, bul_glass_2, bul_glass_3, bul_glass_4                                                                               |
| Gun        | ak47_SFX, colt_shot_1, glock_reload_1, glock_reload_2, glock_reload_3, glock_shot_1, glock_shot_2, jackh_loop, jackh_loop_e, jackh_reload_1, jackh_reload_2, jackh_reload_3, jackh_reload_4, m16_g_reload_1, m16_loop, m16_loop_e, m16_reload_1, m16_reload_2, m16_reload_3, m203_launch_1, m2hb_loop |
| Nature     | tree_01, tree_02, tree_03                                                                                                        |
| Person     | man_01, man_02, woman_01, woman_02                                                                                                |
| Plastic    | bul_plastic_1, bul_plastic_2, bul_plastic_3                                                                                      |
| Rock       | bul_rock_1, bul_rock_2, bul_rock_3                                                                                              |
| Wood       | bul_wood_1, bul_wood_2, bul_wood_3                                                                                              |

---

