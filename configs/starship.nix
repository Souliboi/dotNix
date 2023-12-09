{config, lib, ...}:

{
    programs.starship = {
            enable = true;
            settings = { 
                format = "[❯ ](#FF6969)$username $directory $git_branch $git_status $dotnet $c $golang $java $nodejs $rust $cmd_duration $line_break[❯ ](#FF6969)";

                directory = {
                    format = "[$path]($style)"; 
                };
                c = {
                    format = "[$symbol ($version(-$name))]($style)";
                };
                cmd_duration = {
                    format = "[⏱ $duration]($style)";
                };
                dotnet = {
                    format = "[$symbol($version) (🎯 $tfm)]($style)";
                };
                git_branch = {
                    format = "[$symbol$branch]($style)";
                };
                git_status = {
                    format = "([$all_status $ahead_behind]($style))";
                };
                golang = {
                    format = "[$symbol ($version)]($style)";
                };
                java = {
                    format = "[$symbol ($version)]($style)";
                };
                nix_shell = {
                    format = "[$symbol $state ($name)]($style)";
                };
                nodejs = {
                    format = "[$symbol ($version)]($style)";
                };
                os = {
                    format = "[$symbol]($style)";
                };
                rust = {
                    format = "[$symbol ($version)]($style)";
                };
                time = {
                    format = "[$time]($style)";
                };
                username = {
                    format = "[$user]($style)";
                    show_always = true;
                    style_user = "fg:#fc0331";
                };
            };
        };
}
