@"
{% macro Dimension(name) %}
{{ name }}
{% endmacro %}
"@ | Out-File -FilePath "macros/dimension.sql" -Encoding utf8