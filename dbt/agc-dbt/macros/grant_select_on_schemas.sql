

{% macro grant_select_on_schemas(schemas, groups) %}
  {% set groups_csv = 'group' ~  groups | join(', group ') %}
  {% for schema in schemas %}
    grant usage on schema {{ schema }} to group {{ groups_csv }};
    grant select on all tables in schema {{ schema }} to group {{ groups_csv }};
    alter default privileges in schema {{ schema }}
        grant select on tables to group {{ groups_csv }};
  {% endfor %}
{% endmacro %}


