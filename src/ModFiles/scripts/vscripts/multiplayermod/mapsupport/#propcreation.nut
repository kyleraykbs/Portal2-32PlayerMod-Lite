// ╔═╗╦═╗╔═╗╔═╗  ╔═╗╦═╗╔═╗╔═╗╔╦╗╦╔═╗╔╗╔  ╔═╗╔═╗╔╦╗╔═╗
// ╠═╝╠╦╝║ ║╠═╝  ║  ╠╦╝║╣ ╠═╣ ║ ║║ ║║║║  ║  ║ ║ ║║║╣
// ╩  ╩╚═╚═╝╩    ╚═╝╩╚═╚═╝╩ ╩ ╩ ╩╚═╝╝╚╝  ╚═╝╚═╝═╩╝╚═╝
// ╦╔╦╗╔═╗╔═╗╦═╗╔╦╗╔═╗╔╦╗  ╔═╗╦═╗╔═╗╔╦╗  ╔═╗╔╦╗╔═╗╔╦╗
// ║║║║╠═╝║ ║╠╦╝ ║ ║╣  ║║  ╠╣ ╠╦╝║ ║║║║  ║ ╦║║║║ ║ ║║
// ╩╩ ╩╩  ╚═╝╩╚═ ╩ ╚═╝═╩╝  ╚  ╩╚═╚═╝╩ ╩  ╚═╝╩ ╩╚═╝═╩╝

function CreatePropsForLevel(CacheTime, CreateTime) {

  //==================================//
  //CREATE OBJECTS FOR sp_a3_crazy_box//
  //==================================//

  if (GetMapName() == "sp_a3_crazy_box") {
    if (CacheTime) {
        // Cache Objects

        PrecacheModel("props_bts/vactube_128_straight.mdl")

        PrecacheModel("props_underground/underground_boxdropper.mdl")

        PrecacheModel("props_underground/underground_boxdropper_cage.mdl")

        PrecacheModel("props_factory/factory_panel_metal_chopped_top_128x128.mdl")

        g_bDoneCacheing = true
    }

    if (CreateTime) {
      // Create Objects

      local sp_a3_crazy_box_custom_prop_9 = CreateProp("prop_dynamic", Vector(878.75024414062, -1112.2896728516, 2054.7436523438), "models/props_bts/vactube_128_straight.mdl", 0)
      sp_a3_crazy_box_custom_prop_9.SetAngles(2.7340308861312e-07, -179.99995422363, 90.000022888184)
      sp_a3_crazy_box_custom_prop_9.__KeyValueFromString("solid", "6")
      sp_a3_crazy_box_custom_prop_9.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a3_crazy_box_custom_prop_10 = CreateProp("prop_dynamic", Vector(878.75024414062, -1112.2896728516, 2566.7436523438), "models/props_bts/vactube_128_straight.mdl", 0)
      sp_a3_crazy_box_custom_prop_10.SetAngles(2.7340277597432e-07, -179.99989318848, 90.000030517578)
      sp_a3_crazy_box_custom_prop_10.__KeyValueFromString("solid", "6")
      sp_a3_crazy_box_custom_prop_10.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a3_crazy_box_custom_prop_11 = CreateProp("prop_dynamic", Vector(878.75024414062, -1112.2896728516, 2694.7436523438), "models/props_bts/vactube_128_straight.mdl", 0)
      sp_a3_crazy_box_custom_prop_11.SetAngles(2.7340274755261e-07, -179.99989318848, 90.000030517578)
      sp_a3_crazy_box_custom_prop_11.__KeyValueFromString("solid", "6")
      sp_a3_crazy_box_custom_prop_11.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a3_crazy_box_custom_prop_12 = CreateProp("prop_dynamic", Vector(878.75024414062, -1112.2896728516, 2182.7436523438), "models/props_bts/vactube_128_straight.mdl", 0)
      sp_a3_crazy_box_custom_prop_12.SetAngles(2.7340297492628e-07, -179.99989318848, 90.000030517578)
      sp_a3_crazy_box_custom_prop_12.__KeyValueFromString("solid", "6")
      sp_a3_crazy_box_custom_prop_12.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a3_crazy_box_custom_prop_13 = CreateProp("prop_dynamic", Vector(878.75024414062, -1112.2896728516, 2310.7436523438), "models/props_bts/vactube_128_straight.mdl", 0)
      sp_a3_crazy_box_custom_prop_13.SetAngles(2.7340294650458e-07, -179.99989318848, 90.000030517578)
      sp_a3_crazy_box_custom_prop_13.__KeyValueFromString("solid", "6")
      sp_a3_crazy_box_custom_prop_13.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a3_crazy_box_custom_prop_14 = CreateProp("prop_dynamic", Vector(878.75024414062, -1112.2896728516, 2438.7436523438), "models/props_bts/vactube_128_straight.mdl", 0)
      sp_a3_crazy_box_custom_prop_14.SetAngles(2.7340283281774e-07, -179.99989318848, 90.000030517578)
      sp_a3_crazy_box_custom_prop_14.__KeyValueFromString("solid", "6")
      sp_a3_crazy_box_custom_prop_14.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a3_crazy_box_custom_prop_15 = CreateProp("prop_dynamic", Vector(877.98041992188, -1112.2999023438, 1952.1126708984), "models/props_underground/underground_boxdropper.mdl", 0)
      sp_a3_crazy_box_custom_prop_15.SetAngles(0, 90, 0)
      sp_a3_crazy_box_custom_prop_15.__KeyValueFromString("solid", "6")
      sp_a3_crazy_box_custom_prop_15.__KeyValueFromString("targetname", "genericcustomprop_maindropper")

      local sp_a3_crazy_box_custom_prop_16 = CreateProp("prop_dynamic", Vector(877.94549560547, -1111.8862304688, 1951.9709472656), "models/props_underground/underground_boxdropper_cage.mdl", 0)
      sp_a3_crazy_box_custom_prop_16.SetAngles(-7.4231045998841e-20, 89.99989318848, 1.52587890625e-05)
      sp_a3_crazy_box_custom_prop_16.__KeyValueFromString("solid", "6")
      sp_a3_crazy_box_custom_prop_16.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a3_crazy_box_custom_prop_17 = CreateProp("prop_dynamic", Vector(878.23785400391, -1111.7216796875, 2049.7453613281), "models/props_factory/factory_panel_metal_chopped_top_128x128.mdl", 0)
      sp_a3_crazy_box_custom_prop_17.SetAngles(89.999992370605, 90, 180)
      sp_a3_crazy_box_custom_prop_17.__KeyValueFromString("solid", "6")
      sp_a3_crazy_box_custom_prop_17.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a3_crazy_box_custom_prop_17, "AddOutput", "modelscale 0.9", 0, null, null)
      EntFireByHandle(sp_a3_crazy_box_custom_prop_17, "color", "0 0 0 255", 0, null, null)
    }
  }

  //=============================//
  //CREATE OBJECTS FOR sp_a2_bts2//
  //=============================//

  if (GetMapName() == "sp_a2_bts2") {
    if (CacheTime) {
      // Cache Objects

      PrecacheModel("props_bts/hanging_walkway_128a.mdl")

      g_bDoneCacheing = true
    }

    if (CreateTime) {
      // Create Objects

      local sp_a2_bts2_custom_prop_144 = CreateProp("prop_dynamic", Vector(1210.9047851562, -3591.4580078125, 10.96333694458), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_144.SetAngles(-89.999946594238, -179.99993896484, 180)
      sp_a2_bts2_custom_prop_144.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_144.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_144, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_145 = CreateProp("prop_dynamic", Vector(1210.9046630859, -3463.4580078125, 10.96333694458), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_145.SetAngles(-89.999946594238, -179.99992370605, 180)
      sp_a2_bts2_custom_prop_145.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_145.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_145, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_146 = CreateProp("prop_dynamic", Vector(1407.3646240234, -3066.5859375, 10.300641059875), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_146.SetAngles(-89.979080200195, 90.006011962891, 180)
      sp_a2_bts2_custom_prop_146.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_146.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_146, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_147 = CreateProp("prop_dynamic", Vector(1733.7668457031, -3890.8125, 9.1990060806274), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_147.SetAngles(-89.999946594238, 9.5622635853942e-05, 180)
      sp_a2_bts2_custom_prop_147.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_147.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_147, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_148 = CreateProp("prop_dynamic", Vector(1732.4794921875, -3133.6625976562, 10.172374725342), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_148.SetAngles(-89.999984741211, 8.720429832465e-06, 180)
      sp_a2_bts2_custom_prop_148.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_148.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_148, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_149 = CreateProp("prop_dynamic", Vector(1210.9049072266, -3719.4580078125, 10.96333694458), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_149.SetAngles(-89.999946594238, -179.99995422363, 180)
      sp_a2_bts2_custom_prop_149.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_149.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_149, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_150 = CreateProp("prop_dynamic", Vector(1210.9050292969, -3847.4582519531, 10.96333694458), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_150.SetAngles(-89.999946594238, -179.99996948242, 180)
      sp_a2_bts2_custom_prop_150.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_150.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_150, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_151 = CreateProp("prop_dynamic", Vector(1210.9045410156, -3335.4580078125, 10.96333694458), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_151.SetAngles(-89.999946594238, -179.99990844727, 180)
      sp_a2_bts2_custom_prop_151.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_151.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_151, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_152 = CreateProp("prop_dynamic", Vector(1210.904296875, -3207.4577636719, 10.96333694458), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_152.SetAngles(-89.999946594238, -179.99989318848, 180)
      sp_a2_bts2_custom_prop_152.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_152.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_152, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_153 = CreateProp("prop_dynamic", Vector(1210.9040527344, -3079.4577636719, 10.96333694458), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_153.SetAngles(-89.999946594238, -179.99989318848, 180)
      sp_a2_bts2_custom_prop_153.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_153.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_153, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_154 = CreateProp("prop_dynamic", Vector(1279.3647460938, -3066.5993652344, 10.300641059875), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_154.SetAngles(-89.979103088379, 90.006004333496, 180)
      sp_a2_bts2_custom_prop_154.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_154.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_154, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_155 = CreateProp("prop_dynamic", Vector(2119.7722167969, -3195.4938964844, 12.396705627441), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_155.SetAngles(-89.999946594238, 89.999984741211, 180)
      sp_a2_bts2_custom_prop_155.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_155.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_155, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_156 = CreateProp("prop_dynamic", Vector(2244.1625976562, -3520.9521484375, 13.540298461914), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_156.SetAngles(-89.911918640137, -0.34657052159309, -179.76554870605)
      sp_a2_bts2_custom_prop_156.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_156.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_156, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_157 = CreateProp("prop_dynamic", Vector(1733.7669677734, -4018.8125, 9.1990060806274), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_157.SetAngles(-89.999954223633, 5.4641506721964e-05, 180)
      sp_a2_bts2_custom_prop_157.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_157.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_157, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_158 = CreateProp("prop_dynamic", Vector(1733.7672119141, -4146.8125, 9.1990060806274), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_158.SetAngles(-89.999946594238, 9.5622635853942e-05, 180)
      sp_a2_bts2_custom_prop_158.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_158.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_158, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_159 = CreateProp("prop_dynamic", Vector(2176.3408203125, -3588.1184082031, 10.380084037781), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_159.SetAngles(-89.999984741211, -89.999992370605, 180)
      sp_a2_bts2_custom_prop_159.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_159.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_159, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_160 = CreateProp("prop_dynamic", Vector(1733.7663574219, -3634.8125, 9.1990060806274), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_160.SetAngles(-89.999946594238, 0.00010928301344393, 180)
      sp_a2_bts2_custom_prop_160.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_160.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_160, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_161 = CreateProp("prop_dynamic", Vector(2244.4130859375, -3392.9523925781, 13.541104316711), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_161.SetAngles(-89.911918640137, -0.34657019376755, -179.76554870605)
      sp_a2_bts2_custom_prop_161.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_161.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_161, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_162 = CreateProp("prop_dynamic", Vector(2247.7722167969, -3195.4938964844, 12.396705627441), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_162.SetAngles(-89.999946594238, 89.999984741211, 180)
      sp_a2_bts2_custom_prop_162.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_162.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_162, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_163 = CreateProp("prop_dynamic", Vector(1663.3646240234, -3066.5588378906, 10.300641059875), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_163.SetAngles(-89.979080200195, 90.006042480469, 180)
      sp_a2_bts2_custom_prop_163.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_163.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_163, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_164 = CreateProp("prop_dynamic", Vector(1535.3646240234, -3066.572265625, 10.300641059875), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_164.SetAngles(-89.979080200195, 90.00602722168, 180)
      sp_a2_bts2_custom_prop_164.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_164.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_164, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_165 = CreateProp("prop_dynamic", Vector(1210.9050292969, -4103.4584960938, 10.96333694458), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_165.SetAngles(-89.999984741211, 180, 180)
      sp_a2_bts2_custom_prop_165.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_165.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_165, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_166 = CreateProp("prop_dynamic", Vector(1733.7666015625, -3762.8125, 9.1990060806274), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_166.SetAngles(-89.999946594238, 0.00010928301344393, 180)
      sp_a2_bts2_custom_prop_166.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_166.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_166, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_167 = CreateProp("prop_dynamic", Vector(1863.7722167969, -3195.4938964844, 12.396701812744), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_167.SetAngles(-89.999984741211, 89.999984741211, 180)
      sp_a2_bts2_custom_prop_167.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_167.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_167, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_168 = CreateProp("prop_dynamic", Vector(1210.9050292969, -3975.4584960938, 10.96333694458), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_168.SetAngles(-89.999954223633, -179.99998474121, 180)
      sp_a2_bts2_custom_prop_168.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_168.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_168, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_169 = CreateProp("prop_dynamic", Vector(1991.7722167969, -3195.4938964844, 12.396705627441), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_169.SetAngles(-89.999954223633, 89.999984741211, 180)
      sp_a2_bts2_custom_prop_169.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_169.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_169, "disabledraw", "", 0, null, null)

      local sp_a2_bts2_custom_prop_170 = CreateProp("prop_dynamic", Vector(2244.6635742188, -3264.9526367188, 13.541909217834), "models/props_bts/hanging_walkway_128a.mdl", 0)
      sp_a2_bts2_custom_prop_170.SetAngles(-89.91194152832, -0.34656989574432, -179.76559448242)
      sp_a2_bts2_custom_prop_170.__KeyValueFromString("solid", "6")
      sp_a2_bts2_custom_prop_170.__KeyValueFromString("targetname", "genericcustomprop")
      EntFireByHandle(sp_a2_bts2_custom_prop_170, "disabledraw", "", 0, null, null)
    }
  }

  //==============================//
  //CREATE OBJECTS FOR sp_a4_intro//
  //==============================//

  if (GetMapName() == "sp_a4_intro") {
    if (CacheTime) {
      // Cache Objects

      PrecacheModel("props_backstage/vacum_flange_a.mdl")

      PrecacheModel("props_bts/vactube_90deg_04.mdl")

      PrecacheModel("props_bts/vactube_connector.mdl")

      PrecacheModel("props_bts/vactube_90deg_03.mdl")

      PrecacheModel("props_bts/vactube_128_straight.mdl")

      PrecacheModel("props_bts/vactube_90deg_06.mdl")

      g_bDoneCacheing = true
    }

    if (CreateTime) {
      // Create Objects

      local sp_a4_intro_custom_prop_85 = CreateProp("prop_dynamic", Vector(-495.125, -642.375, 1143.5625), "models/props_backstage/vacum_flange_a.mdl", 0)
      sp_a4_intro_custom_prop_85.SetAngles(59.6875, 60.718757629395, 111.28124237061)
      sp_a4_intro_custom_prop_85.__KeyValueFromString("solid", "0")
      sp_a4_intro_custom_prop_85.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a4_intro_custom_prop_86 = CreateProp("prop_dynamic", Vector(-774.5625, -253.6876373291, 1026.40625), "models/props_bts/vactube_90deg_04.mdl", 0)
      sp_a4_intro_custom_prop_86.SetAngles(63.843761444092, -159.71875, 66.0625)
      sp_a4_intro_custom_prop_86.__KeyValueFromString("solid", "6")
      sp_a4_intro_custom_prop_86.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a4_intro_custom_prop_88 = CreateProp("prop_dynamic", Vector(-339.96875, -349.03125, 616.875), "models/props_bts/vactube_connector.mdl", 0)
      sp_a4_intro_custom_prop_88.SetAngles(-5.25093264514e-06, -20.968757629395, 119.24993896484)
      sp_a4_intro_custom_prop_88.__KeyValueFromString("solid", "6")
      sp_a4_intro_custom_prop_88.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a4_intro_custom_prop_89 = CreateProp("prop_dynamic", Vector(-320.39205932617, -297.9621887207, 518.37902832031), "models/props_backstage/vacum_flange_a.mdl", 0)
      sp_a4_intro_custom_prop_89.SetAngles(0.162034496665, -21.449562072754, -60.187835693359)
      sp_a4_intro_custom_prop_89.__KeyValueFromString("solid", "0")
      sp_a4_intro_custom_prop_89.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a4_intro_custom_prop_90 = CreateProp("prop_dynamic", Vector(-762.59375, -616.3125, 1082.21875), "models/props_backstage/vacum_flange_a.mdl", 0)
      sp_a4_intro_custom_prop_90.SetAngles(58.374984741211, 59.843753814697, -159.5)
      sp_a4_intro_custom_prop_90.__KeyValueFromString("solid", "0")
      sp_a4_intro_custom_prop_90.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a4_intro_custom_prop_92 = CreateProp("prop_dynamic", Vector(-782.25, -262.78125, 1031.75), "models/props_bts/vactube_connector.mdl", 0)
      sp_a4_intro_custom_prop_92.SetAngles(63.312507629395, -159.18748474121, 65.53125)
      sp_a4_intro_custom_prop_92.__KeyValueFromString("solid", "6")
      sp_a4_intro_custom_prop_92.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a4_intro_custom_prop_95 = CreateProp("prop_dynamic", Vector(-536.125, -270.625, 897.96875), "models/props_bts/vactube_90deg_03.mdl", 0)
      sp_a4_intro_custom_prop_95.SetAngles(61.15625, -171.15625, 146.25)
      sp_a4_intro_custom_prop_95.__KeyValueFromString("solid", "6")
      sp_a4_intro_custom_prop_95.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a4_intro_custom_prop_97 = CreateProp("prop_dynamic", Vector(-825.71868896484, -508.4375, 1093.5), "models/props_bts/vactube_connector.mdl", 0)
      sp_a4_intro_custom_prop_97.SetAngles(-61.281230926514, 21.156240463257, 172.25)
      sp_a4_intro_custom_prop_97.__KeyValueFromString("solid", "6")
      sp_a4_intro_custom_prop_97.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a4_intro_custom_prop_98 = CreateProp("prop_dynamic", Vector(-315.875, -286.06256103516, 495.71878051758), "models/props_bts/vactube_128_straight.mdl", 0)
      sp_a4_intro_custom_prop_98.SetAngles(0, -21, 119.28125)
      sp_a4_intro_custom_prop_98.__KeyValueFromString("solid", "6")
      sp_a4_intro_custom_prop_98.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a4_intro_custom_prop_99 = CreateProp("prop_dynamic", Vector(-504.5, -649.34381103516, 1137.59375), "models/props_bts/vactube_90deg_06.mdl", 0)
      sp_a4_intro_custom_prop_99.SetAngles(59.968746185303, 61.000003814697, 111.5625)
      sp_a4_intro_custom_prop_99.__KeyValueFromString("solid", "6")
      sp_a4_intro_custom_prop_99.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a4_intro_custom_prop_100 = CreateProp("prop_dynamic", Vector(-338.125, -344.03137207031, 606.37512207031), "models/props_bts/vactube_90deg_04.mdl", 0)
      sp_a4_intro_custom_prop_100.SetAngles(-23.937503814697, 32.062507629395, 107.03125)
      sp_a4_intro_custom_prop_100.__KeyValueFromString("solid", "6")
      sp_a4_intro_custom_prop_100.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a4_intro_custom_prop_101 = CreateProp("prop_dynamic", Vector(-534.65625, -272.0625, 897.93743896484), "models/props_backstage/vacum_flange_a.mdl", 0)
      sp_a4_intro_custom_prop_101.SetAngles(60.71875, -170.71875, 146.25)
      sp_a4_intro_custom_prop_101.__KeyValueFromString("solid", "0")
      sp_a4_intro_custom_prop_101.__KeyValueFromString("targetname", "genericcustomprop")

      local sp_a4_intro_custom_prop_102 = CreateProp("prop_dynamic", Vector(-767.5, -610.53131103516, 1084), "models/props_bts/vactube_90deg_03.mdl", 0)
      sp_a4_intro_custom_prop_102.SetAngles(60.0625, 61.093719482422, -158.37501525879)
      sp_a4_intro_custom_prop_102.__KeyValueFromString("solid", "6")
      sp_a4_intro_custom_prop_102.__KeyValueFromString("targetname", "genericcustomprop")
    }
  }

  //===============================//
  //CREATE OBJECTS FOR sp_a1_intro1//
  //===============================//

  if (GetMapName() == "sp_a1_intro1") {
    if (CacheTime) {
        // Cache Objects

        PrecacheModel("props_bts/lab_pod_b_low.mdl")

        PrecacheModel("models/props_factory/turret_factory_open/turret_factory_open.mdl")

        PrecacheModel("models/props_underground/underground_testchamber_button.mdl")

        PrecacheModel("models/props_office/cabinet_small_door.mdl")

        g_bDoneCacheing = true
    }

    if (CreateTime) {
      // Create Objects

      // ContainerBedPropCollision
      local sp_a1_intro1_custom_prop_95 = CreateProp("prop_dynamic", Vector(-9469, -491, -3152), "models/container_ride/endstate_vcollide.mdl", 0)
      sp_a1_intro1_custom_prop_95.SetAngles(-6.8249382972717, -0.23543548583984, 0.75763827562332)
      sp_a1_intro1_custom_prop_95.__KeyValueFromString("solid", "6")
      sp_a1_intro1_custom_prop_95.__KeyValueFromString("targetname", "ContainerBedPropCollision")
      sp_a1_intro1_custom_prop_95.__KeyValueFromString("rendermode", "10")

      // ContainerFloorPropCollision
      local sp_a1_intro1_custom_prop_96 = CreateProp("prop_dynamic", Vector(-5755, 1912, 11), "models/props_bts/lab_pod_b_low.mdl", 0)
      sp_a1_intro1_custom_prop_96.SetAngles(0, -90, 0)
      sp_a1_intro1_custom_prop_96.__KeyValueFromString("solid", "6")
      sp_a1_intro1_custom_prop_96.__KeyValueFromString("targetname", "ContainerFloorPropCollision")
      sp_a1_intro1_custom_prop_96.__KeyValueFromString("rendermode", "10")

      // ContainerCeilingPropCollision
      local sp_a1_intro1_custom_prop_97 = CreateProp("prop_dynamic", Vector(-5755, 1912, 346), "models/props_bts/lab_pod_b_low.mdl", 0)
      sp_a1_intro1_custom_prop_97.SetAngles(0, -90, 0)
      sp_a1_intro1_custom_prop_97.__KeyValueFromString("solid", "6")
      sp_a1_intro1_custom_prop_97.__KeyValueFromString("targetname", "ContainerCeilingPropCollision")
      sp_a1_intro1_custom_prop_97.__KeyValueFromString("rendermode", "10")

      // ContainerRightWallPropCollision
      local sp_a1_intro1_custom_prop_98 = CreateProp("prop_dynamic", Vector(-5755, 1705, 176), "models/props_bts/lab_pod_b_low.mdl", 0)
      sp_a1_intro1_custom_prop_98.SetAngles(0, -90, 0)
      sp_a1_intro1_custom_prop_98.__KeyValueFromString("solid", "6")
      sp_a1_intro1_custom_prop_98.__KeyValueFromString("targetname", "ContainerRightWallPropCollision")
      sp_a1_intro1_custom_prop_98.__KeyValueFromString("rendermode", "10")

      // ContainerLeftWallPropCollision
      local sp_a1_intro1_custom_prop_99 = CreateProp("prop_dynamic", Vector(-5755, 2120, 176), "models/props_bts/lab_pod_b_low.mdl", 0)
      sp_a1_intro1_custom_prop_99.SetAngles(0, -90, 0)
      sp_a1_intro1_custom_prop_99.__KeyValueFromString("solid", "6")
      sp_a1_intro1_custom_prop_99.__KeyValueFromString("targetname", "ContainerLeftWallPropCollision")
      sp_a1_intro1_custom_prop_99.__KeyValueFromString("rendermode", "10")

      // ContainerFrontWallPropCollision
      local sp_a1_intro1_custom_prop_100 = CreateProp("prop_dynamic", Vector(-5535, 1912, 282), "models/props_bts/lab_pod_b_low.mdl", 0)
      sp_a1_intro1_custom_prop_100.SetAngles(0, -90, -90)
      sp_a1_intro1_custom_prop_100.__KeyValueFromString("solid", "6")
      sp_a1_intro1_custom_prop_100.__KeyValueFromString("targetname", "ContainerFrontWallPropCollision")
      sp_a1_intro1_custom_prop_100.__KeyValueFromString("rendermode", "10")

      // ContainerNightstandsPropCollision
      local sp_a1_intro1_custom_prop_101 = CreateProp("prop_physics", Vector(-5701, 1780, 113), "models/props_factory/turret_factory_open/turret_factory_open.mdl", 0)
      sp_a1_intro1_custom_prop_101.SetAngles(0, 0, 0)
      sp_a1_intro1_custom_prop_101.__KeyValueFromString("solid", "6")
      sp_a1_intro1_custom_prop_101.__KeyValueFromString("targetname", "ContainerNightstandsPropCollision")
      sp_a1_intro1_custom_prop_101.__KeyValueFromString("rendermode", "10")

      // ContainerLightPropCollision
      local sp_a1_intro1_custom_prop_102 = CreateProp("prop_physics", Vector(-5651, 1912, 313), "models/props_underground/underground_testchamber_button.mdl", 0)
      sp_a1_intro1_custom_prop_102.SetAngles(0, 0, 0)
      sp_a1_intro1_custom_prop_102.__KeyValueFromString("solid", "6")
      sp_a1_intro1_custom_prop_102.__KeyValueFromString("targetname", "ContainerLightPropCollision")
      sp_a1_intro1_custom_prop_102.__KeyValueFromString("rendermode", "10")

      // ContainerWheatleyPropCollision
      local sp_a1_intro1_custom_prop_103 = CreateProp("prop_physics", Vector(-5696, 1882, 320), "models/props_office/cabinet_small_door.mdl", 0)
      sp_a1_intro1_custom_prop_103.SetAngles(0, 0, 0)
      sp_a1_intro1_custom_prop_103.__KeyValueFromString("solid", "6")
      sp_a1_intro1_custom_prop_103.__KeyValueFromString("targetname", "ContainerWheatleyPropCollision")
      sp_a1_intro1_custom_prop_103.__KeyValueFromString("rendermode", "10")

      // ContainerDeskPropCollision
      local sp_a1_intro1_custom_prop_104 = CreateProp("prop_physics", Vector(-5733, 2028, 138), "models/props_factory/turret_factory_open/turret_factory_open.mdl", 0)
      sp_a1_intro1_custom_prop_104.SetAngles(0, 180, 0)
      sp_a1_intro1_custom_prop_104.__KeyValueFromString("solid", "6")
      sp_a1_intro1_custom_prop_104.__KeyValueFromString("targetname", "ContainerDeskPropCollision")
      sp_a1_intro1_custom_prop_104.__KeyValueFromString("rendermode", "10")

      // ContainerPlantPropCollision
      local sp_a1_intro1_custom_prop_105 = CreateProp("prop_physics", Vector(-5520, 2008, 111), "models/props_factory/turret_factory_open/turret_factory_open.mdl", 0)
      sp_a1_intro1_custom_prop_105.SetAngles(0, 180, 0)
      sp_a1_intro1_custom_prop_105.__KeyValueFromString("solid", "6")
      sp_a1_intro1_custom_prop_105.__KeyValueFromString("targetname", "ContainerPlantPropCollision")
      sp_a1_intro1_custom_prop_105.__KeyValueFromString("rendermode", "10")

      // ContainerChairPropCollision
      local sp_a1_intro1_custom_prop_106 = CreateProp("prop_physics", Vector(-5519, 1802, 138), "models/props_factory/turret_factory_open/turret_factory_open.mdl", 0)
      sp_a1_intro1_custom_prop_106.SetAngles(0, 0, 0)
      sp_a1_intro1_custom_prop_106.__KeyValueFromString("solid", "6")
      sp_a1_intro1_custom_prop_106.__KeyValueFromString("targetname", "ContainerChairPropCollision")
      sp_a1_intro1_custom_prop_106.__KeyValueFromString("rendermode", "10")
    }
  }

  if (CacheTime) {
    g_bDoneCacheing = true
  }

}