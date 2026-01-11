pragma Singleton

import Quickshell

Singleton {
    function getSafeClass(modelData) {
        const o = modelData?.lastIpcObject
        var c = o?.class ?? ""
        if (!c) c = o?.initialClass ?? ""
        if (!c) c = o?.initialTitle ?? ""
        if (!c) c = modelData?.title ?? ""
        return String(c)
    }

    function getIcon(modelData) {
        const safeClass = getSafeClass(modelData);
        var c = (safeClass || "").toLowerCase();

        if (c.includes("firefox") || c.includes("zen") || c.includes("librewolf"))
            return "󰈹";
        if (c.includes("chromium") || c.includes("chrome") || c.includes("thorium"))
            return "";
        if (c.includes("vivaldi"))
            return "";
        if (c.includes("brave"))
            return "";
        if (c.includes("qutebrowser"))
            return "󰖟";
        if (c.includes("kitty"))
            return "󰄛";
        if (c.includes("alacritty") || c.includes("foot") || c.includes("terminal") || c.includes("ghostty") || c.includes("wezterm"))
            return "";
        if (c.includes("code") || c.includes("codium"))
            return "󰨞";
        if (c.includes("sublime"))
            return "󰅳";
        if (c.includes("neovide") || c.includes("nvim"))
            return "";
        if (c.includes("idea") || c.includes("jetbrains"))
            return "";
        if (c.includes("pycharm"))
            return "";
        if (c.includes("webstorm"))
            return "";
        if (c.includes("clion"))
            return "";
        if (c.includes("android"))
            return "󰀴";
        if (c.includes("kate") || c.includes("texteditor"))
            return "󰈔";
        if (c.includes("nautilus") || c.includes("org.gnome.nautilus") || c.includes("files"))
            return "";
        if (c.includes("thunar") || c.includes("dolphin") || c.includes("nemo"))
            return "";
        if (c.includes("discord") || c.includes("vesktop"))
            return "󰙯";
        if (c.includes("slack"))
            return "󰒱";
        if (c.includes("telegram"))
            return "";
        if (c.includes("signal"))
            return "󰭹";
        if (c.includes("element"))
            return "󰘨";
        if (c.includes("whatsapp"))
            return "󰖣";
        if (c.includes("spotify"))
            return "";
        if (c.includes("vlc"))
            return "󰕼";
        if (c.includes("mpv") || c.includes("haruna") || c.includes("strawberry") || c.includes("rhythmbox") || c.includes("totem"))
            return "";
        if (c.includes("gimp"))
            return "";
        if (c.includes("inkscape"))
            return "󰕙";
        if (c.includes("krita"))
            return "";
        if (c.includes("blender"))
            return "󰂫";
        if (c.includes("audacity"))
            return "󰎈";
        if (c.includes("obs"))
            return "";
        if (c.includes("kdenlive"))
            return "󰕧";
        if (c.includes("steam"))
            return "";
        if (c.includes("lutris"))
            return "󰺵";
        if (c.includes("heroic"))
            return "󰊖";
        if (c.includes("prismlauncher"))
            return "󰍳";
        if (c.includes("writer"))
            return "󰈬";
        if (c.includes("calc"))
            return "󰧷";
        if (c.includes("impress"))
            return "󰈧";
        if (c.includes("libreoffice"))
            return "󰈙";
        if (c.includes("evince"))
            return "󰈦";
        if (c.includes("thunderbird"))
            return "";
        if (c.includes("settings") || c.includes("missioncenter"))
            return "";
        if (c.includes("look"))
            return "";
        if (c.includes("systemmonitor"))
            return "󰄨";
        if (c.includes("pavucontrol"))
            return "󰕾";
        if (c.includes("calculator"))
            return "󰃬";
        if (c.includes("weather"))
            return "";
        if (c.includes("evercal"))
            return "󰃭";
        if (c.includes("playing"))
            return "󰎄";
        if (c.includes("photos") || c.includes("org.gnome.loupe") || c.includes("imv") || c.includes("feh") || c.includes("eog") || c.includes("gthumb") || c.includes("qimgv") || c.includes("viewnior"))
            return "";
        if (c.includes("swappy"))
            return "󰫕";

        return "";
    }
}
