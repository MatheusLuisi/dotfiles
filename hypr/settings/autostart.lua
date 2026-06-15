-------------------
---- AUTOSTART ----
-------------------

-- https://wiki.hypr.land/Configuring/Basics/Autostart/


hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("awww-daemon") -- (awww-daemon & disown) (awww img [image/path])
end)
