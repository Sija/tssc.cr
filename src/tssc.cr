require "./core_ext/**"

{% if @top_level.has_constant?(:JSON) %}
  require "./tssc/json"
{% end %}

{% if @top_level.has_constant?(:YAML) %}
  require "./tssc/yaml"
{% end %}
