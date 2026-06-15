------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto-left",
    scale    = "auto",
})

hl.monitor({
   output    ="HDMI-A-2",
   mode      ="1920x1080@120",
   position  ="auto",
   scale     ="1",
})

-- Workspaces 1-5 on main monitor 

hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-2", persistent = true})
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-2", persistent = true})
hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-2", persistent = true})
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-2", persistent = true})
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-2", persistent = true})