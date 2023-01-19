#!/usr/bin/env bash
main() {
    local prefix
    cpu_usage_total=$(top -b -n2 -p 1 | grep -F "Cpu(s)" | tail -1 | awk -F'id,' -v prefix="$prefix" '{ split($1, vs, ","); v=vs[length(vs)]; sub("%", "", v); printf "%s%.1f%%\n", prefix, 100 - v }')
    echo "Total CPU usage: $cpu_usage_total"
}
main "$@"
