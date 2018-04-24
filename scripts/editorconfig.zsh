#!/usr/bin/env zsh

editorconf ()
{
read -d '' String <<"EOF"
[root] = true

[*]
charset = utf-8
end_of_line = lf
indent_style = space
indent_size = 2
EOF

echo "${String}" > $(pwd)/.editorconfig
}
