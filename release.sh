#!/bin/bash

CONFIG_FILES=$(cat <<EOF
1.yaml
extra.yaml
EOF
)

main() {
  for yaml in $CONFIG_FILES; do
    mrs="${yaml/.yaml/.generated.mrs}"
    mihomo convert-ruleset ipcidr yaml "$yaml" "$mrs"
    git add "$yaml" "$mrs"
  done

  git commit -v
  git push
}

main
