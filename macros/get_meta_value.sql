{%- macro get_meta_value(model, meta_key, def_value={}) -%}
    {# Get meta value from model configuration #}
    {%- if execute -%}
        {%- if model is none -%}
            {{ return(def_value) }}
        {%- endif -%}
        
        {%- if model.config is defined and model.config is not none and model.config.meta is defined and model.config.meta is not none -%}
            {{ return(model.config.meta.get(meta_key, def_value)) }}
        {%- else -%}
            {{ return(def_value) }}
        {%- endif -%}
    {%- else -%}
        {{ return(def_value) }}
    {%- endif -%}
{%- endmacro -%}